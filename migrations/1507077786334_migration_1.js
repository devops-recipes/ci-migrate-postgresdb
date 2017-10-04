exports.up = (pgm) => {
  pgm.addColumns('role', { role_description: 'varchar (255)' });
};

exports.down = (pgm) => {
  pgm.dropColumns('role', ['role_description'], {ifExists: true})
};
