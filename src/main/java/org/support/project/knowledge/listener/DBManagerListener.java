package org.support.project.knowledge.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.support.project.common.log.Log;
import org.support.project.common.log.LogFactory;
import org.support.project.common.logic.H2DBServerLogic;
import org.support.project.knowledge.logic.CustomDBConnectionLogic;
import org.support.project.web.listener.H2DBManagerListener;
import org.support.project.web.logic.DBConnenctionLogic;

/**
 * Application Lifecycle Listener implementation class DBManagerListener
 *
 */
@WebListener
public class DBManagerListener implements ServletContextListener {
    
	private static final Log LOG = LogFactory.getLog(DBManagerListener.class);

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        LOG.trace("H2DBManagerListener#contextInitialized");
        if (CustomDBConnectionLogic.get().connectCustomConnection()) {
            // カスタムコネクションに接続したので、組み込みDBは起動しない
            return;
        }
        // カスタマイズコネクション設定が存在しないので、デフォルトの組み込みDBをサーバーモードで起動
        H2DBServerLogic logic = H2DBServerLogic.get();
        logic.start();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        H2DBServerLogic logic = H2DBServerLogic.get();
        if (logic.isActive()) {
            logic.stop();
        }
    }
	
}
