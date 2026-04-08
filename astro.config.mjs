// @ts-check
import { defineConfig } from 'astro/config'
import starlight from '@astrojs/starlight'

// https://astro.build/config
export default defineConfig({
  site: 'https://mel-cell.github.io',
  base: '/modul-web-smk6-2026',
  trailingSlash: 'always',
  integrations: [
    starlight({
      title: 'Dokumentasi Website SMKN 6 Malang',
      social: [
        {
          icon: 'github',
          label: 'GitHub',
          href: 'https://github.com/mel-cell/modul-web-smk6-2026',
        },
      ],
      sidebar: [
        {
          label: 'Part 1: Introduction',
          autogenerate: { directory: 'introduction' },
        },
        {
          label: 'Part 2: Developer Guide',
          items: [
            {
              label: 'Getting Started',
              autogenerate: { directory: 'developer-guide/getting-started' },
            },
            {
              label: 'Payload CMS Architecture',
              autogenerate: { directory: 'developer-guide/architecture' },
            },
            {
              label: 'Frontend Development',
              autogenerate: { directory: 'developer-guide/frontend' },
            },
            {
              label: 'Advanced Maintenance',
              autogenerate: { directory: 'developer-guide/advanced' },
            },
          ],
        },
        {
          label: 'Part 3: Admin Guide',
          items: [
            {
              label: '1. Introduction',
              autogenerate: { directory: 'admin-guide/introduction' },
            },
            {
              label: '2. Content Management',
              autogenerate: { directory: 'admin-guide/content-management' },
            },
            {
              label: '3. Smart Tour (360°)',
              autogenerate: { directory: 'admin-guide/content-management/smart-tour' },
            },
            {
              label: '4. Media Management',
              autogenerate: { directory: 'admin-guide/media-management' },
            },
          ],
        },
        {
          label: 'Part 4: Desktop App',
          items: [
            {
              label: 'Introduction',
              autogenerate: { directory: 'desktop-app/introduction' },
            },
            {
              label: 'User Guide',
              autogenerate: { directory: 'desktop-app/user-guide' },
            },
            {
              label: 'Development',
              autogenerate: { directory: 'desktop-app/development' },
            },
          ],
        },
      ],
    }),
  ],
})
