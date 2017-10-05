var db = require('./index.js').db,
    expect = require('chai').expect;

describe('Migration tests', function () {
  it('Check if the article table exists', function () {
    db.schema.hasTable('article').then(function (exists) {
      expect(exists).to.equal(true);
    });
  });
  it('Check if the article table has the column added during the migration', function () {
    db.schema.hasColumn('article', 'article_author').then(function (exists) {
      expect(exists).to.equal(true);
    });
  });
});
