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
      title: 'The SMK6 Engine',
      social: [
        {
          icon: 'github',
          label: 'GitHub',
          href: 'https://github.com/mel-cell/modul-web-smk6-2026',
        },
      ],
      sidebar: [
        {
          label: 'Start Here',
          items: [{ label: 'Overview', slug: '' }],
        },
        {
          label: 'Core Knowledge',
          autogenerate: { directory: 'basic-knowledge' },
        },
        {
          label: 'Architecture',
          autogenerate: { directory: 'payload-architecture' },
        },
        {
          label: 'Development',
          autogenerate: { directory: 'development-guide' },
        },
      ],
    }),
  ],
})
