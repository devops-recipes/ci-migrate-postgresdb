exports.up = (pgm) => {
  pgm.addColumns('article', { article_author: 'varchar (255) NOT NULL' });
};

exports.down = (pgm) => {
  pgm.dropColumns('article', ['article_author'], {ifExists: true})
};
