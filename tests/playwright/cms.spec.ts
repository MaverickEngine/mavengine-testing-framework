import endpoint from "./types.spec";
import { test, expect } from '@playwright/test'
import dotenv from 'dotenv';
dotenv.config();

test('should be able to login', async ({ page }) => {
    await page.goto(`${endpoint.URL}/wp-admin`);
    await page.click('text=Log In');
    await page.fill('input[name="log"]', process.env.WORDPRESS_ADMIN_USER ?? '');
    await page.fill('input[name="pwd"]', process.env.WORDPRESS_ADMIN_PASSWORD ?? '');
    await page.click('text=Log In');
    await page.waitForSelector('text=Dashboard');
    expect(await page.textContent('text=Dashboard')).toBe('Dashboard');
});