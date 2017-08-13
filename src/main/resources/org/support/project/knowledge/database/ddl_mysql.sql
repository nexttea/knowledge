CREATE TABLE ACCESS_LOGS
(
    NO bigint AUTO_INCREMENT PRIMARY KEY NOT NULL,
    PATH varchar(1024),
    IP_ADDRESS varchar(64),
    USER_AGENT varchar(1024),
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE ACCOUNT_IMAGES
(
    IMAGE_ID bigint  AUTO_INCREMENT PRIMARY KEY NOT NULL,
    USER_ID integer,
    FILE_NAME varchar(256),
    FILE_SIZE double,
    FILE_BINARY BLOB,
    EXTENSION varchar(256),
    CONTENT_TYPE varchar(256),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE UNIQUE INDEX IDX_ACCOUNT_IMAGES_USER_ID ON ACCOUNT_IMAGES (USER_ID);

CREATE TABLE COMMENTS
(
    COMMENT_NO bigint  AUTO_INCREMENT PRIMARY KEY NOT NULL,
    KNOWLEDGE_ID bigint NOT NULL,
    COMMENT text,
    COMMENT_STATUS integer,
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);
CREATE INDEX IDX_COMMENTS_KNOWLEDGE_ID ON COMMENTS (KNOWLEDGE_ID);

CREATE TABLE CONFIRM_MAIL_CHANGES
(
    ID varchar(192) PRIMARY KEY NOT NULL,
    USER_ID integer NOT NULL,
    MAIL_ADDRESS varchar(256) NOT NULL,
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE DRAFT_ITEM_VALUES
(
    DRAFT_ID bigint NOT NULL,
    TYPE_ID integer NOT NULL,
    ITEM_NO integer NOT NULL,
    ITEM_VALUE text,
    ITEM_STATUS integer NOT NULL,
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer,
    CONSTRAINT DRAFT_ITEM_VALUES_PKC PRIMARY KEY (DRAFT_ID, TYPE_ID, ITEM_NO)
);

CREATE TABLE DRAFT_KNOWLEDGES
(
    DRAFT_ID bigint AUTO_INCREMENT PRIMARY KEY NOT NULL,
    KNOWLEDGE_ID bigint,
    TITLE varchar(1024) NOT NULL,
    CONTENT text,
    PUBLIC_FLAG integer,
    ACCESSES text,
    EDITORS text,
    TAG_NAMES text,
    TYPE_ID integer,
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE FUNCTIONS
(
    FUNCTION_KEY varchar(64) PRIMARY KEY NOT NULL,
    DESCRIPTION varchar(256),
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE GROUPS
(
    GROUP_ID integer PRIMARY KEY NOT NULL,
    GROUP_KEY varchar(68) NOT NULL,
    GROUP_NAME varchar(128) NOT NULL,
    DESCRIPTION varchar(256),
    PARENT_GROUP_KEY varchar(128),
    GROUP_CLASS integer,
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE HASH_CONFIGS
(
    SYSTEM_NAME varchar(64) PRIMARY KEY NOT NULL,
    HASH_ITERATIONS integer NOT NULL,
    HASH_SIZE_BITS integer NOT NULL,
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE ITEM_CHOICES
(
    TYPE_ID integer NOT NULL,
    ITEM_NO integer NOT NULL,
    CHOICE_NO integer NOT NULL,
    CHOICE_VALUE varchar(256) NOT NULL,
    CHOICE_LABEL varchar(256) NOT NULL,
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer,
    CONSTRAINT ITEM_CHOICES_PKC PRIMARY KEY (TYPE_ID, ITEM_NO, CHOICE_NO)
);

CREATE TABLE KNOWLEDGE_EDIT_GROUPS
(
    KNOWLEDGE_ID bigint NOT NULL,
    GROUP_ID integer NOT NULL,
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer,
    CONSTRAINT KNOWLEDGE_EDIT_GROUPS_PKC PRIMARY KEY (KNOWLEDGE_ID, GROUP_ID)
);

CREATE TABLE KNOWLEDGE_EDIT_USERS
(
    KNOWLEDGE_ID bigint NOT NULL,
    USER_ID integer NOT NULL,
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer,
    CONSTRAINT KNOWLEDGE_EDIT_USERS_PKC PRIMARY KEY (KNOWLEDGE_ID, USER_ID)
);

CREATE TABLE KNOWLEDGE_FILES
(
    FILE_NO bigint AUTO_INCREMENT PRIMARY KEY NOT NULL,
    KNOWLEDGE_ID bigint,
    COMMENT_NO bigint,
    DRAFT_ID bigint,
    FILE_NAME varchar(256),
    FILE_SIZE double,
    FILE_BINARY BLOB,
    PARSE_STATUS integer NOT NULL,
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);
CREATE INDEX IDX_KNOWLEDGE_FILES_KNOWLEDGE_ID ON KNOWLEDGE_FILES (KNOWLEDGE_ID);

CREATE TABLE KNOWLEDGE_GROUPS
(
    KNOWLEDGE_ID bigint NOT NULL,
    GROUP_ID integer NOT NULL,
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer,
    CONSTRAINT KNOWLEDGE_GROUPS_PKC PRIMARY KEY (KNOWLEDGE_ID, GROUP_ID)
);

CREATE TABLE KNOWLEDGE_HISTORIES
(
    KNOWLEDGE_ID bigint NOT NULL,
    HISTORY_NO integer NOT NULL,
    TITLE varchar(1024) NOT NULL,
    CONTENT text,
    PUBLIC_FLAG integer,
    TAG_IDS varchar(1024),
    TAG_NAMES text,
    LIKE_COUNT bigint,
    COMMENT_COUNT integer,
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer,
    CONSTRAINT KNOWLEDGE_HISTORIES_PKC PRIMARY KEY (KNOWLEDGE_ID, HISTORY_NO)
);

CREATE TABLE KNOWLEDGE_ITEM_VALUES
(
    KNOWLEDGE_ID bigint NOT NULL,
    TYPE_ID integer NOT NULL,
    ITEM_NO integer NOT NULL,
    ITEM_VALUE text,
    ITEM_STATUS integer NOT NULL,
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer,
    CONSTRAINT KNOWLEDGE_ITEM_VALUES_PKC PRIMARY KEY (KNOWLEDGE_ID, TYPE_ID, ITEM_NO)
);

CREATE TABLE KNOWLEDGE_TAGS
(
    KNOWLEDGE_ID bigint NOT NULL,
    TAG_ID integer NOT NULL,
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer,
    CONSTRAINT KNOWLEDGE_TAGS_PKC PRIMARY KEY (KNOWLEDGE_ID, TAG_ID)
);

CREATE TABLE KNOWLEDGE_USERS
(
    KNOWLEDGE_ID bigint NOT NULL,
    USER_ID integer NOT NULL,
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer,
    CONSTRAINT KNOWLEDGE_USERS_PKC PRIMARY KEY (KNOWLEDGE_ID, USER_ID)
);

CREATE TABLE KNOWLEDGES
(
    KNOWLEDGE_ID bigint AUTO_INCREMENT PRIMARY KEY NOT NULL,
    TITLE varchar(1024) NOT NULL,
    CONTENT text,
    PUBLIC_FLAG integer,
    TAG_IDS varchar(1024),
    TAG_NAMES text,
    LIKE_COUNT bigint,
    COMMENT_COUNT integer,
    TYPE_ID integer,
    NOTIFY_STATUS integer,
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE LDAP_CONFIGS
(
    SYSTEM_NAME varchar(64) PRIMARY KEY NOT NULL,
    HOST varchar(256) NOT NULL,
    PORT integer NOT NULL,
    USE_SSL integer,
    USE_TLS integer,
    BIND_DN varchar(256),
    BIND_PASSWORD varchar(1024),
    SALT varchar(1024),
    BASE_DN varchar(256) NOT NULL,
    FILTER varchar(256),
    ID_ATTR varchar(256) NOT NULL,
    NAME_ATTR varchar(256),
    MAIL_ATTR varchar(256),
    ADMIN_CHECK_FILTER varchar(256),
    AUTH_TYPE integer NOT NULL,
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE LIKES
(
    NO bigint AUTO_INCREMENT PRIMARY KEY NOT NULL,
    KNOWLEDGE_ID bigint NOT NULL,
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE INDEX IDX_LIKES_KNOWLEDGE_ID ON LIKES (KNOWLEDGE_ID);

CREATE TABLE LOCALES
(
    `KEY` varchar(12) PRIMARY KEY NOT NULL,
    `LANGUAGE` varchar(4) NOT NULL,
    COUNTRY varchar(4),
    VARIANT varchar(4),
    DISP_NAME varchar(128),
    FLAG_ICON varchar(24),
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE LOGIN_HISTORIES
(
    USER_ID integer NOT NULL,
    LOGIN_COUNT double NOT NULL,
    LODIN_DATE_TIME timestamp NOT NULL,
    IP_ADDRESS varchar(15),
    USER_AGENT varchar(256),
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer,
    CONSTRAINT LOGIN_HISTORIES_PKC PRIMARY KEY (USER_ID, LOGIN_COUNT)
);

CREATE TABLE MAIL_CONFIGS
(
    SYSTEM_NAME varchar(64) PRIMARY KEY NOT NULL,
    HOST varchar(256) NOT NULL,
    PORT integer NOT NULL,
    AUTH_TYPE integer NOT NULL,
    SMTP_ID varchar(256),
    SMTP_PASSWORD varchar(1024),
    SALT varchar(1024),
    FROM_ADDRESS varchar(256),
    FROM_NAME varchar(256),
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE MAIL_HOOK_CONDITIONS
(
    HOOK_ID integer NOT NULL,
    CONDITION_NO integer NOT NULL,
    CONDITION_KIND integer NOT NULL,
    `CONDITION` varchar(256),
    PROCESS_USER integer NOT NULL,
    PROCESS_USER_KIND integer NOT NULL,
    PUBLIC_FLAG integer NOT NULL,
    TAGS text,
    VIEWERS text,
    EDITORS text,
    POST_LIMIT integer,
    LIMIT_PARAM varchar(256),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer,
    CONSTRAINT MAIL_HOOK_CONDITIONS_PKC PRIMARY KEY (HOOK_ID, CONDITION_NO)
);

CREATE TABLE MAIL_HOOKS
(
    HOOK_ID integer AUTO_INCREMENT PRIMARY KEY NOT NULL,
    MAIL_PROTOCOL varchar(10) NOT NULL,
    MAIL_HOST varchar(256) NOT NULL,
    MAIL_PORT integer NOT NULL,
    MAIL_USER varchar(256),
    MAIL_PASS varchar(1024),
    MAIL_PASS_SALT varchar(1024),
    MAIL_FOLDER varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE MAIL_POSTS
(
    MESSAGE_ID varchar(128) PRIMARY KEY NOT NULL,
    POST_KIND integer NOT NULL,
    ID bigint NOT NULL,
    SENDER text,
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE MAILS
(
    MAIL_ID varchar(64) PRIMARY KEY NOT NULL,
    STATUS integer NOT NULL,
    TO_ADDRESS varchar(256) NOT NULL,
    TO_NAME varchar(256),
    FROM_ADDRESS varchar(256),
    FROM_NAME varchar(256),
    TITLE varchar(256) NOT NULL,
    CONTENT text,
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);
CREATE INDEX IDX_MAILS_STATUS ON MAILS (STATUS);

CREATE TABLE NOTICES
(
    NO integer AUTO_INCREMENT PRIMARY KEY NOT NULL,
    TITLE varchar(1024),
    MESSAGE text,
    START_DATETIME timestamp,
    END_DATETIME timestamp,
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE NOTIFY_CONFIGS
(
    USER_ID integer PRIMARY KEY NOT NULL,
    NOTIFY_MAIL integer,
    NOTIFY_DESKTOP integer,
    MY_ITEM_COMMENT integer,
    MY_ITEM_LIKE integer,
    MY_ITEM_STOCK integer,
    TO_ITEM_SAVE integer,
    TO_ITEM_COMMENT integer,
    TO_ITEM_IGNORE_PUBLIC integer,
    STOCK_ITEM_SAVE integer,
    STOKE_ITEM_COMMENT integer,
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE NOTIFY_QUEUES
(
    HASH varchar(32) PRIMARY KEY NOT NULL,
    TYPE integer NOT NULL,
    ID bigint NOT NULL,
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE PASSWORD_RESETS
(
    ID varchar(192) PRIMARY KEY NOT NULL,
    USER_KEY varchar(256),
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE PINS
(
    NO integer AUTO_INCREMENT PRIMARY KEY NOT NULL,
    KNOWLEDGE_ID bigint NOT NULL,
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);
CREATE INDEX IDX_PINS_INSERT_USER ON PINS (INSERT_USER);

CREATE TABLE PROVISIONAL_REGISTRATIONS
(
    ID varchar(192) PRIMARY KEY NOT NULL,
    USER_KEY varchar(256) NOT NULL,
    USER_NAME varchar(256) NOT NULL,
    PASSWORD varchar(1024) NOT NULL,
    SALT varchar(1024) NOT NULL,
    LOCALE_KEY varchar(12),
    MAIL_ADDRESS varchar(256),
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE PROXY_CONFIGS
(
    SYSTEM_NAME varchar(64) PRIMARY KEY NOT NULL,
    PROXY_HOST_NAME varchar(256) NOT NULL,
    PROXY_PORT_NO integer NOT NULL,
    PROXY_AUTH_TYPE integer NOT NULL,
    PROXY_AUTH_USER_ID varchar(256),
    PROXY_AUTH_PASSWORD varchar(1024),
    PROXY_AUTH_SALT varchar(1024),
    PROXY_AUTH_PC_NAME varchar(256),
    PROXY_AUTH_DOMAIN varchar(256),
    THIRD_PARTY_CERTIFICATE integer,
    TEST_URL varchar(256),
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE READ_MARKS
(
    NO integer NOT NULL,
    USER_ID integer NOT NULL,
    SHOW_NEXT_TIME integer,
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer,
    CONSTRAINT READ_MARKS_PKC PRIMARY KEY (NO, USER_ID)
);

CREATE TABLE ROLE_FUNCTIONS
(
    ROLE_ID integer NOT NULL,
    FUNCTION_KEY varchar(64) NOT NULL,
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer,
    CONSTRAINT ROLE_FUNCTIONS_PKC PRIMARY KEY (ROLE_ID, FUNCTION_KEY)
);

CREATE TABLE ROLES
(
    ROLE_ID integer  AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ROLE_KEY varchar(12) NOT NULL,
    ROLE_NAME varchar(50),
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE STOCK_KNOWLEDGES
(
    STOCK_ID bigint NOT NULL,
    KNOWLEDGE_ID bigint NOT NULL,
    COMMENT varchar(1024),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer,
    CONSTRAINT STOCK_KNOWLEDGES_PKC PRIMARY KEY (STOCK_ID, KNOWLEDGE_ID)
);

CREATE TABLE STOCKS
(
    STOCK_ID bigint AUTO_INCREMENT PRIMARY KEY NOT NULL,
    STOCK_NAME varchar(256) NOT NULL,
    STOCK_TYPE integer NOT NULL,
    DESCRIPTION varchar(1024),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE SYSTEM_ATTRIBUTES
(
    SYSTEM_NAME varchar(64) NOT NULL,
    CONFIG_NAME varchar(192) NOT NULL,
    CONFIG_VALUE text,
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer,
    CONSTRAINT SYSTEM_ATTRIBUTES_PKC PRIMARY KEY (SYSTEM_NAME, CONFIG_NAME)
);

CREATE TABLE SYSTEM_CONFIGS
(
    SYSTEM_NAME varchar(64) NOT NULL,
    CONFIG_NAME varchar(192) NOT NULL,
    CONFIG_VALUE varchar(1024),
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer,
    CONSTRAINT SYSTEM_CONFIGS_PKC PRIMARY KEY (SYSTEM_NAME, CONFIG_NAME)
);

CREATE TABLE SYSTEMS
(
    SYSTEM_NAME varchar(64) PRIMARY KEY NOT NULL,
    VERSION varchar(16) NOT NULL,
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE TAGS
(
    TAG_ID integer AUTO_INCREMENT PRIMARY KEY NOT NULL,
    TAG_NAME varchar(128) NOT NULL,
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE TEMPLATE_ITEMS
(
    TYPE_ID integer NOT NULL,
    ITEM_NO integer NOT NULL,
    ITEM_NAME varchar(32) NOT NULL,
    ITEM_TYPE integer NOT NULL,
    DESCRIPTION varchar(1024),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer,
    CONSTRAINT TEMPLATE_ITEMS_PKC PRIMARY KEY (TYPE_ID, ITEM_NO)
);

CREATE TABLE TEMPLATE_MASTERS
(
    TYPE_ID integer AUTO_INCREMENT PRIMARY KEY NOT NULL,
    TYPE_NAME varchar(256) NOT NULL,
    TYPE_ICON varchar(64),
    DESCRIPTION varchar(1024),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE USER_CONFIGS
(
    SYSTEM_NAME varchar(64) NOT NULL,
    USER_ID integer NOT NULL,
    CONFIG_NAME varchar(192) NOT NULL,
    CONFIG_VALUE varchar(1024),
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer,
    CONSTRAINT USER_CONFIGS_PKC PRIMARY KEY (SYSTEM_NAME, USER_ID, CONFIG_NAME)
);

CREATE TABLE USER_GROUPS
(
    USER_ID integer NOT NULL,
    GROUP_ID integer NOT NULL,
    GROUP_ROLE integer,
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer,
    CONSTRAINT USER_GROUPS_PKC PRIMARY KEY (USER_ID, GROUP_ID)
);

CREATE TABLE USER_ROLES
(
    USER_ID integer NOT NULL,
    ROLE_ID integer NOT NULL,
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer,
    CONSTRAINT USER_ROLES_PKC PRIMARY KEY (USER_ID, ROLE_ID)
);

CREATE TABLE USERS
(
    USER_ID integer AUTO_INCREMENT PRIMARY KEY NOT NULL,
    USER_KEY varchar(192) NOT NULL,
    USER_NAME varchar(256) NOT NULL,
    `PASSWORD` varchar(1024) NOT NULL,
    SALT varchar(1024),
    LOCALE_KEY varchar(12),
    MAIL_ADDRESS varchar(256),
    AUTH_LDAP integer,
    ROW_ID varchar(64),
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);
CREATE UNIQUE INDEX IDX_USERS_USER_KEY ON USERS (USER_KEY);

CREATE TABLE VIEW_HISTORIES
(
    HISTORY_NO bigint  AUTO_INCREMENT PRIMARY KEY NOT NULL,
    KNOWLEDGE_ID bigint NOT NULL,
    VIEW_DATE_TIME timestamp NOT NULL,
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);
CREATE INDEX IDX_VIEW_HISTORIES_KNOWLEDGE_ID ON VIEW_HISTORIES (KNOWLEDGE_ID);

CREATE TABLE VOTES
(
    VOTE_NO bigint AUTO_INCREMENT PRIMARY KEY NOT NULL,
    KNOWLEDGE_ID bigint NOT NULL,
    VOTE_KIND integer NOT NULL,
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);
CREATE INDEX IDX_VOTES_KNOWLEDGE_ID ON VOTES (KNOWLEDGE_ID);

CREATE TABLE WEBHOOK_CONFIGS
(
    HOOK_ID integer AUTO_INCREMENT PRIMARY KEY NOT NULL,
    HOOK varchar(20) NOT NULL,
    URL varchar(256) NOT NULL,
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);

CREATE TABLE WEBHOOKS
(
    WEBHOOK_ID varchar(64) PRIMARY KEY NOT NULL,
    `STATUS` integer NOT NULL,
    HOOK varchar(20),
    CONTENT text,
    INSERT_USER integer,
    INSERT_DATETIME timestamp,
    UPDATE_USER integer,
    UPDATE_DATETIME timestamp,
    DELETE_FLAG integer
);
CREATE INDEX IDX_WEBHOOKS_STATUS ON WEBHOOKS (STATUS);