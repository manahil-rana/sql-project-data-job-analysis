
/*  CREATE TABLE january_jobs (
        SELECT *
        FROM job_postings_fact)

        -- option 2 
        (job_id INT,
        company_id INT,
        job_title_short VARCHAR(255),
        job_title TEXT,
        job_location TEXT,
        job_via TEXT,
        job_schedule_type TEXT,
        job_work_from_home BOOLEAN,
        search_location TEXT,
        job_posted_date TIMESTAMP
        );
*/

/*  INSERT INTO january_jobs (
        SELECT *
        FROM job_postings_fact)

        -- option 2
        job_id,
        company_id,
        job_title_short,
        job_title,
        job_location,
        job_via,
        job_schedule_type,
        job_work_from_home,
        search_location,
        job_posted_date
        );

    VALUES 
        (SELECT * 
        FROM job_postings_fact
        WHERE EXTRACT(MONTH FROM job_posted_date) = 1;)
*/
    
    
    
    
-- january   
CREATE TABLE january_jobs AS
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- february
CREATE TABLE february_jobs AS
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- march
CREATE TABLE march_jobs AS
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;