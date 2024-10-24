import { expect, test } from "@playwright/test";
import AxeBuilder from "@axe-core/playwright";

// Reset storage state for this file to avoid being authenticated
test.use({ storageState: { cookies: [], origins: [] } });

test.describe("parks listing", () => {
  test.beforeEach(async ({ page }) => {
    await page.goto("/activities/42FD78B9-2B90-4AA9-BC43-F10E9FEA8B5A");
  });

  test("should not have any automatically detectable accessibility errors", async ({
    page,
  }) => {
    const accessibilityScanResults = await new AxeBuilder({ page }).analyze();

    expect(accessibilityScanResults.violations).toEqual([]);
  });
});
