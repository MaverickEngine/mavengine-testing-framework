import { Browser, Page } from "playwright";

import dotenv from 'dotenv';
dotenv.config();

declare global {
    const page: Page;
    const browser: Browser;
    const browserName: string;
}

const url = process.env.WORDPRESS_WEBSITE_URL ??'http://localhost:8081';

export default {
    URL: url,
};