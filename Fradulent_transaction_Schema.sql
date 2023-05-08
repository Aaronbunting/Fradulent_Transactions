select * from transaction

select * from cardholder

select * from credit_card

ALTER TABLE transaction
ADD COLUMN cardholder_id INTEGER,
ADD CONSTRAINT fk_cardholder_id
    FOREIGN KEY (cardholder_id)
    REFERENCES cardholder (cardholder_id);

-- Update cardholder_id in transaction table based on credit_card table
UPDATE transaction t
SET cardholder_id = t.cardholder_id
FROM credit_card c
WHERE t.card_number = c.card_number;


UPDATE transaction
SET cardholder_id = cardholder.cardholder_id
FROM credit_card
JOIN cardholder ON credit_card.card_holder_name = cardholder.cardholder_name
WHERE transaction.card_number = credit_card.card_number;

SELECT *
FROM transaction
JOIN credit_card ON transaction.card_number = credit_card.card_number;

