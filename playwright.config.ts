// playwright.config.ts
import { defineConfig } from '@playwright/test';

export default defineConfig({
    testDir: './tests',
    timeout: 10000,
    use: {
        headless: true,
        browserName: 'chromium',
    },
    reporter: [['html', { open: 'never' }]],
});