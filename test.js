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
  it('Check if the article table has the primary KPqdQhxbPa994hnzjcE2VqQpDslf55723cKPUOGSmMY3g', function () {
    db('pg_catalog.pg_indexes').where({tablename: 'article'}).select('indexname').then(function (count) {
      expect(count).to.equal('article_pkey');
    });
  });
});
