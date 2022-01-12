class Contact < ApplicationRecord
  enum subject: { site:0, bug:1, opinion:2, others:3 }
end
