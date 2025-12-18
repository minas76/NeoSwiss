export default function(eleventyConfig) {
  // Copy static assets
  eleventyConfig.addPassthroughCopy("src/css");
  eleventyConfig.addPassthroughCopy("src/js");
  eleventyConfig.addPassthroughCopy("src/images");
  eleventyConfig.addPassthroughCopy("src/fonts");
  eleventyConfig.addPassthroughCopy("src/favicon.svg");
  eleventyConfig.addPassthroughCopy("src/robots.txt");
  eleventyConfig.addPassthroughCopy("src/sitemap.xml");

  // Collections
  eleventyConfig.addCollection("blog", function(collection) {
    return collection.getFilteredByGlob("src/blog/*.md")
      .sort((a, b) => new Date(b.data.date) - new Date(a.data.date));
  });

  eleventyConfig.addCollection("projects", function(collection) {
    return collection.getFilteredByGlob("src/projects/*.md")
      .sort((a, b) => new Date(b.data.date) - new Date(a.data.date));
  });

  eleventyConfig.addCollection("featured", function(collection) {
    return collection.getFilteredByGlob("src/projects/*.md")
      .filter(p => p.data.featured === true)
      .sort((a, b) => new Date(b.data.date) - new Date(a.data.date));
  });

  // Filters
  eleventyConfig.addFilter("readableDate", dateObj => {
    return new Date(dateObj).toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'long',
      day: 'numeric'
    });
  });

  eleventyConfig.addFilter("isoDate", dateObj => {
    return new Date(dateObj).toISOString().split('T')[0];
  });

  eleventyConfig.addFilter("excerpt", (content, length = 150) => {
    const text = content.replace(/<[^>]*>/g, '');
    return text.substring(0, length) + (text.length > length ? '...' : '');
  });

  eleventyConfig.addFilter("readingTime", content => {
    const wordsPerMinute = 200;
    const wordCount = content.split(/\s+/).length;
    const readingTime = Math.ceil(wordCount / wordsPerMinute);
    return `${readingTime} min read`;
  });

  return {
    dir: {
      input: "src",
      output: "_site",
      includes: "_layouts",
      data: "_data"
    },
    templateFormats: ["njk", "md", "html"],
    htmlTemplateEngine: "njk",
    markdownTemplateEngine: "njk"
  };
}
