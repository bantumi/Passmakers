json.extract! contact, :id, :nome, :cognome, :telefono, :email, :sesso, :citta, :provincia, :nazione, :created_at, :updated_at
json.url contact_url(contact, format: :json)
