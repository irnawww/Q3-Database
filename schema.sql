CREATE TABLE subscribers (
    subscriberId VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    plan VARCHAR(20) NOT NULL,
    activationDate DATE NOT NULL
);

CREATE TABLE usage (
    subscriberId VARCHAR(20) NOT NULL,
    callMinutes INTEGER NOT NULL,
    smsCount INTEGER NOT NULL,
    dataUsageMB INTEGER NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    CONSTRAINT fk_usage_subscriber
        FOREIGN KEY (subscriberId)
        REFERENCES subscribers(subscriberId)
);