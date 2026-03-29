import { useEffect, useState } from "react";

function Home() {
  const [jobs, setJobs] = useState([]);

  useEffect(() => {
    fetch("http://localhost:8000/api/jobs")
      .then(res => res.json())
      .then(data => setJobs(data))
      .catch(err => console.error(err));
  }, []);

  return (
    <div>
      <h1 className="text-3xl font-semibold text-purple-600">
        YogiShift
      </h1>

      {jobs.map(job => (
        <div key={job.id}>
          <p>{job.title}</p>
        </div>
      ))}
    </div>
  );
}

export default Home;