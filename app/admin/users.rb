ActiveAdmin.register User do
  permit_params :name, :gender, :birth, :joined_date, :note
end