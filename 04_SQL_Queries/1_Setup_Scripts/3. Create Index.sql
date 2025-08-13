-- Transactions
CREATE INDEX idx_txn_customer_date ON transactions(customer_id, transaction_date);

CREATE INDEX idx_transactions_category ON transactions(product_category);

CREATE INDEX idx_transactions_product_name ON transactions(product_name);

CREATE INDEX idx_transactions_payment ON transactions(payment_method);



-- Customers
CREATE INDEX idx_customers_customer_id ON customers(customer_id);



-- Interactions
CREATE INDEX idx_interactions_type_date ON interactions(interaction_type, interaction_date);



-- Support Tickets
CREATE INDEX idx_tickets_status ON support_tickets(resolution_status);

CREATE INDEX idx_tickets_submission_date ON support_tickets(submission_date);
