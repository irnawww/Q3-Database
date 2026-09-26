INSERT INTO subscribers
    (subscriberId, name, plan, activationDate)
VALUES
    ('SUB07', 'Fajar', 'Basic', '2024-01-24');

-- 2. Update Fajar's plan to Premium
UPDATE subscribers
SET plan = 'Premium'
WHERE subscriberId = 'SUB07';

-- 3. Calculate total data usage for Premium subscribers
SELECT
    SUM(u.dataUsageMB) AS totalDataUsageMB
FROM subscribers s
JOIN usage u
    ON s.subscriberId = u.subscriberId
WHERE s.plan = 'Premium';

-- 4. Find the top 3 subscribers by total data usage
SELECT
    s.subscriberId,
    s.name,
    SUM(u.dataUsageMB) AS totalDataUsageMB
FROM subscribers s
JOIN usage u
    ON s.subscriberId = u.subscriberId
GROUP BY
    s.subscriberId,
    s.name
ORDER BY
    totalDataUsageMB DESC
LIMIT 3;

-- 5. Find subscribers whose average call minutes per snapshot
-- is less than or equal to 50
SELECT
    subscriberId,
    AVG(callMinutes) AS averageCallMinutes
FROM usage
GROUP BY subscriberId
HAVING AVG(callMinutes) <= 50
ORDER BY subscriberId;