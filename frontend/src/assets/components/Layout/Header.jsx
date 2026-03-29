import { Link } from "react-router-dom";

function Header() {
  return (
    <header>
      <h1><Link to="/">YogiShift</Link></h1>

      <nav>
        <ul>
          <li><Link to="/jobs">Jobs</Link></li>
          <li><Link to="/teacher-dashboard">Teacher</Link></li>
          <li><Link to="/studio-dashboard">Studio</Link></li>
          <li><Link>Login</Link></li>
        </ul>
      </nav>
    </header>
  )
}

export default Header;