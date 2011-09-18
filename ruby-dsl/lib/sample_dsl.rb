entity "Customer"
identified_by "Id", :guid
must_have "Name", :string
can_have "Email", :string

entity "Product"
identified_by "Id", :guid
must_have "Name", :string
must_have "Price", :integer

entity "InvoiceLine"
identified_by "Id", :guid
must_reference "Product"
must_have "Count", :integer

entity "Invoice"
identified_by "Id", :guid
must_reference "Customer"
must_have "Date", :date
can_have "Discount", :double
contains "Lines", "InvoiceLine"
