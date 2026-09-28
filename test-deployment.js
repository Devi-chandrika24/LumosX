// Test script to verify deployment structure
const fs = require('fs');
const path = require('path');

console.log('🧪 Testing Vercel deployment structure...\n');

// Check if required files exist
const requiredFiles = [
  'api/health.js',
  'api/test.js',
  'vercel.json',
  'package.json',
  'frontend/package.json'
];

let allFilesExist = true;

requiredFiles.forEach(file => {
  if (fs.existsSync(file)) {
    console.log(`✅ ${file} exists`);
  } else {
    console.log(`❌ ${file} missing`);
    allFilesExist = false;
  }
});

// Check API function structure
console.log('\n🔍 Checking API function structure...');

const apiFiles = fs.readdirSync('api');
console.log(`API files found: ${apiFiles.join(', ')}`);

// Check if API functions export default handler
apiFiles.forEach(file => {
  if (file.endsWith('.js')) {
    const content = fs.readFileSync(`api/${file}`, 'utf8');
    if (content.includes('export default function handler')) {
      console.log(`✅ ${file} has proper handler export`);
    } else {
      console.log(`❌ ${file} missing handler export`);
      allFilesExist = false;
    }
  }
});

// Check vercel.json structure
console.log('\n🔍 Checking vercel.json...');
try {
  const vercelConfig = JSON.parse(fs.readFileSync('vercel.json', 'utf8'));
  if (vercelConfig.builds && vercelConfig.builds.length > 0) {
    console.log('✅ vercel.json has builds configuration');
  } else {
    console.log('❌ vercel.json missing builds configuration');
    allFilesExist = false;
  }
} catch (error) {
  console.log('❌ vercel.json is invalid JSON');
  allFilesExist = false;
}

console.log('\n' + '='.repeat(50));

if (allFilesExist) {
  console.log('🎉 All checks passed! Ready for Vercel deployment.');
  console.log('\n📋 Next steps:');
  console.log('1. git init');
  console.log('2. git add .');
  console.log('3. git commit -m "Fix Vercel API"');
  console.log('4. git push to GitHub');
  console.log('5. Deploy on Vercel');
  console.log('\n🧪 Test endpoints after deployment:');
  console.log('- /api/health');
  console.log('- /api/test');
} else {
  console.log('❌ Some checks failed. Please fix the issues above.');
}

console.log('\n' + '='.repeat(50));



