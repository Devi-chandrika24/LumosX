// Test script to verify API setup
const axios = require('axios');

async function testAPI() {
  console.log('🧪 Testing API endpoints...\n');
  
  // Test health endpoint
  try {
    console.log('1. Testing /api/health endpoint...');
    const healthResponse = await axios.get('http://localhost:5000/api/health');
    console.log('✅ Health check passed:', healthResponse.data);
  } catch (error) {
    console.log('❌ Health check failed:', error.message);
  }
  
  // Test auth endpoints
  try {
    console.log('\n2. Testing /api/auth/register endpoint...');
    const registerResponse = await axios.post('http://localhost:5000/api/auth/register', {
      name: 'Test User',
      email: 'test@example.com',
      password: 'test123',
      role: 'student'
    });
    console.log('✅ Registration test passed:', registerResponse.data);
  } catch (error) {
    console.log('❌ Registration test failed:', error.response?.data || error.message);
  }
  
  console.log('\n🎉 API testing completed!');
}

// Run the test
testAPI();



