import { Routes, Route } from 'react-router-dom'
import MainLayout from './assets/components/Layout/MainLayout'
import Home from './assets/components/Home'

function App() {
  return (
    <Routes>
      <Route element={<MainLayout />}>
        <Route path="/" element={<Home />} />
      </Route>
    </Routes>
  )
}

export default App