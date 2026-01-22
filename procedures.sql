DROP PROCEDURE CreateOrder;

DELIMITER $$
CREATE PROCEDURE CreateOrder(
	IN p_product_id INT,
    IN p_stock_qty INT
)
BEGIN
	DECLARE v_count INT;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
        RESIGNAL;
	end;
    
    SELECT count(*)
    INTO v_count
    FROM products
    WHERE product_id=p_product_id AND p_stock_qty <= stock_qty;
    
    IF v_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid product or insufficient stock';
    END IF;
	
    START TRANSACTION;
        
	INSERT INTO sales (product_id, quantity_sold, sale_date)
	VALUES(p_product_id, p_stock_qty, CURRENT_TIMESTAMP());
        
	UPDATE products 
	SET stock_qty = stock_qty-p_stock_qty
	WHERE product_id= p_product_id;
        
	COMMIT;
	SELECT 'Transaction complete' AS message;        
END $$
DELIMITER ;