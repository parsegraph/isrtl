## Deployment

1. Ensure package's build number is incremented in both package.json and package-prod.json.

2. Push to github on main.

3. Await successful github development build. Fix if errors.

4. Download development ZIP artifact and move it to project directory.

5. Unzip development ZIP artifact, revealing .tgz archive.

6. npm publish [development-tarball] --tag dev

7. Test dev NPM package. Return to step 1 if development package fails testing.

8. Await successful github production build. Fix if errors.

9. Download production ZIP artifact and move it to project directory.

10. Unzip production ZIP artifact, revealing .tgz archive.

11. npm publish [production-tarball]

12. Test prod NPM package. Return to step 1 if production package fails testing.
