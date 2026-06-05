
-- EXCLUSÔES
-- 1. Apagar os tipos ligados às subcategorias de Armors
DELETE FROM ItemTypes 
WHERE subcategory_id IN (
    SELECT subcategory_id 
    FROM ItemSubcategories 
    WHERE category_id = (SELECT category_id FROM ItemCategories WHERE name='Armors')
);

-- 2. Agora apagar as subcategorias de Armors
DELETE FROM ItemSubcategories 
WHERE category_id = (SELECT category_id FROM ItemCategories WHERE name='Armors');

-- ✅ Alternativa mais prática
-- Apagar tudo de uma vez sem se preocupar com a ordem:
SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM ItemSubcategories 
WHERE category_id = (SELECT category_id FROM ItemCategories WHERE name='Armors');

SET FOREIGN_KEY_CHECKS = 1;
