package org.support.project.knowledge.logic;

import java.io.File;

import org.support.project.common.config.ConfigLoader;
import org.support.project.common.log.Log;
import org.support.project.common.log.LogFactory;
import org.support.project.di.Container;
import org.support.project.ormapping.config.ConnectionConfig;
import org.support.project.web.config.AppConfig;
import org.support.project.web.logic.DBConnenctionLogic;

public class CustomDBConnectionLogic extends DBConnenctionLogic
{
    /** ログ */
    private static final Log LOG = LogFactory.getLog(CustomDBConnectionLogic.class);

    private static final String CONNECTION_CONFIG = "custom_connection.xml";

    /**
     * Get instance
     * 
     * @return instance
     */
    public static CustomDBConnectionLogic get() {
        return Container.getComp(CustomDBConnectionLogic.class);
    }
    
    
	/* (non-Javadoc)
	 * @see org.support.project.web.logic.DBConnenctionLogic#getCustomConnectionConfigPath()
	 */
	@Override
	public File getCustomConnectionConfigPath()
	{
        AppConfig appConfig = ConfigLoader.load(AppConfig.APP_CONFIG, AppConfig.class);
        File base = new File(this.getClass().getClassLoader().getResource("").getPath());
        File config = new File(base, CONNECTION_CONFIG);
        return config;
	}

	/* (non-Javadoc)
	 * @see org.support.project.web.logic.DBConnenctionLogic#connectCustomConnection()
	 */
	@Override
	public boolean connectCustomConnection()
	{
		// TODO Auto-generated method stub
		return super.connectCustomConnection();
	}

	/* (non-Javadoc)
	 * @see org.support.project.web.logic.DBConnenctionLogic#getCustomConnectionConfig()
	 */
	@Override
	public ConnectionConfig getCustomConnectionConfig()
	{
		// TODO Auto-generated method stub
		return super.getCustomConnectionConfig();
	}

	/* (non-Javadoc)
	 * @see org.support.project.web.logic.DBConnenctionLogic#removeCustomConnectionConfig()
	 */
	@Override
	public void removeCustomConnectionConfig()
	{
		// TODO Auto-generated method stub
		super.removeCustomConnectionConfig();
	}

	/* (non-Javadoc)
	 * @see org.support.project.web.logic.DBConnenctionLogic#getDefaultConnectionConfig()
	 */
	@Override
	public ConnectionConfig getDefaultConnectionConfig()
	{
		// TODO Auto-generated method stub
		return super.getDefaultConnectionConfig();
	}
	

}
