## Deployment

1. Ensure package number is incremented in both package.json and package-prod.json.

2. Push to github on main.

3. Await successful github build. Fix if errors.

For development and production:

1. Download artifact ZIP file to project directory.

2. Unzip ZIP file to get tarball file in project directory.

3. npm publish [production-tarball] --tag latest

4. npm publish [development-tarball] --tag dev
