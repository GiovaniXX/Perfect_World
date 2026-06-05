
CREATE DATABASE `PW-Database`;
SHOW DATABASES;
USE `PW-Database`;

-- Categorias principais
CREATE TABLE ItemCategories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Subcategorias (ligadas a uma categoria)
CREATE TABLE ItemSubcategories (
    subcategory_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    name VARCHAR(100) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES ItemCategories(category_id)
);

-- Tipos (ligados a uma subcategoria)
CREATE TABLE ItemTypes (
    type_id INT AUTO_INCREMENT PRIMARY KEY,
    subcategory_id INT,
    name VARCHAR(100) NOT NULL,
    FOREIGN KEY (subcategory_id) REFERENCES ItemSubcategories(subcategory_id)
);

-- Itens (ligados a um tipo específico)
CREATE TABLE Items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    type_id INT,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    value INT,
    rarity VARCHAR(50),
    FOREIGN KEY (type_id) REFERENCES ItemTypes(type_id)
);

-- Categorias principais
INSERT INTO ItemCategories (name) VALUES
('Weapons'), ('Armors'), ('Accessory'), ('Runes'), ('Potions'),
('Materials'), ('Item Mall'), ('Attack Charms'), ('Defense Charms'),
('Projectile'), ('Soul Stones'), ('Fashion'), ('Dragon Quest'),
('Genies'), ('War Avatar Cards');

-- SUBCATEGORIES
-- Subcategorias de Weapons
INSERT INTO ItemSubcategories (category_id, name) VALUES
(1, 'Swords & Blades'),
(1, 'Spears & Polearm'),
(1, 'Hammer & Axes'),
(1, 'Range Weapons'),
(1, 'Gloves & Claws'),
(1, 'Whips'),
(1, 'Magical Instrument'),
(1, 'Daggers'),
(1, 'Spheres'),
(1, 'Saber'),
(1, 'Scythe'),
(1, 'Sword Shield'),
(1, 'Firearm');

-- Subcategorias de Armors
INSERT INTO ItemSubcategories (category_id, name) VALUES
((SELECT category_id FROM ItemCategories WHERE name='Armors'), 'Shirt'),
((SELECT category_id FROM ItemCategories WHERE name='Armors'), 'Pants'),
((SELECT category_id FROM ItemCategories WHERE name='Armors'), 'Footwear'),
((SELECT category_id FROM ItemCategories WHERE name='Armors'), 'Helmet'),
((SELECT category_id FROM ItemCategories WHERE name='Armors'), 'WristBracer'),
((SELECT category_id FROM ItemCategories WHERE name='Armors'), 'Manteau');

-- Subcategorias de Accessory
INSERT INTO ItemSubcategories (category_id, name) VALUES
((SELECT category_id FROM ItemCategories WHERE name='Accessory'), 'Necklace'),
((SELECT category_id FROM ItemCategories WHERE name='Accessory'), 'Waist Adorn'),
((SELECT category_id FROM ItemCategories WHERE name='Accessory'), 'Ring');

-- Subcategorias de Potions
INSERT INTO ItemSubcategories (category_id, name) VALUES
((SELECT category_id FROM ItemCategories WHERE name='Potions'), 'Add HP'),
((SELECT category_id FROM ItemCategories WHERE name='Potions'), 'Add MP'),
((SELECT category_id FROM ItemCategories WHERE name='Potions'), 'Add HP & MP'),
((SELECT category_id FROM ItemCategories WHERE name='Potions'), 'Detoxicate'),
((SELECT category_id FROM ItemCategories WHERE name='Potions'), 'Instant Antidote');

-- Subcategorias de Materials
INSERT INTO ItemSubcategories (category_id, name) VALUES
((SELECT category_id FROM ItemCategories WHERE name='Materials'), 'Molds'),
((SELECT category_id FROM ItemCategories WHERE name='Materials'), 'Weapons'),
((SELECT category_id FROM ItemCategories WHERE name='Materials'), 'Armors'),
((SELECT category_id FROM ItemCategories WHERE name='Materials'), 'Accessory'),
((SELECT category_id FROM ItemCategories WHERE name='Materials'), 'Potions'),
((SELECT category_id FROM ItemCategories WHERE name='Materials'), 'Charms'),
((SELECT category_id FROM ItemCategories WHERE name='Materials'), 'Soul Stones/Gems'),
((SELECT category_id FROM ItemCategories WHERE name='Materials'), 'Basic Material'),
((SELECT category_id FROM ItemCategories WHERE name='Materials'), 'Flying Device'),
((SELECT category_id FROM ItemCategories WHERE name='Materials'), 'Crafted Materials');

-- Subcategorias de Item Mall
INSERT INTO ItemSubcategories (category_id, name) VALUES
((SELECT category_id FROM ItemCategories WHERE name='Item Mall'), 'Shop'),
((SELECT category_id FROM ItemCategories WHERE name='Item Mall'), 'Fashion'),
((SELECT category_id FROM ItemCategories WHERE name='Item Mall'), 'Star'),
((SELECT category_id FROM ItemCategories WHERE name='Item Mall'), 'Flyers'),
((SELECT category_id FROM ItemCategories WHERE name='Item Mall'), 'Ride'),
((SELECT category_id FROM ItemCategories WHERE name='Item Mall'), 'Chat'),
((SELECT category_id FROM ItemCategories WHERE name='Item Mall'), 'Utility'),
((SELECT category_id FROM ItemCategories WHERE name='Item Mall'), 'Craft');

-- Categorias sem subcategorias (inserimos direto como "default")
INSERT INTO ItemSubcategories (category_id, name) VALUES
((SELECT category_id FROM ItemCategories WHERE name='Attack Charms'), 'Default'),
((SELECT category_id FROM ItemCategories WHERE name='Defense Charms'), 'Default'),
((SELECT category_id FROM ItemCategories WHERE name='Projectile'), 'Default'),
((SELECT category_id FROM ItemCategories WHERE name='Soul Stones'), 'Default'),
((SELECT category_id FROM ItemCategories WHERE name='Fashion'), 'Default'),
((SELECT category_id FROM ItemCategories WHERE name='Dragon Quest'), 'Default'),
((SELECT category_id FROM ItemCategories WHERE name='Genies'), 'Default'),
((SELECT category_id FROM ItemCategories WHERE name='Runes'), 'Default');

-- Subcategorias de Avatar Cards
INSERT INTO ItemSubcategories (category_id, name) VALUES
((SELECT category_id FROM ItemCategories WHERE name='War Avatar Cards'), 'Destroyer'),
((SELECT category_id FROM ItemCategories WHERE name='War Avatar Cards'), 'Battle'),
((SELECT category_id FROM ItemCategories WHERE name='War Avatar Cards'), 'Longevity'),
((SELECT category_id FROM ItemCategories WHERE name='War Avatar Cards'), 'Durability'),
((SELECT category_id FROM ItemCategories WHERE name='War Avatar Cards'), 'Soulprime'),
((SELECT category_id FROM ItemCategories WHERE name='War Avatar Cards'), 'Lifeprime');

-- ITEM TYPES
-- Tipos dentro de Swords & Blades
INSERT INTO ItemTypes (subcategory_id, name) VALUES
(1, 'Blade'),
(1, 'Sword'),
(1, 'Dual Swords'),
(1, 'Dual Blades');

-- Tipos dentro de Spear & Polearm
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Spears & Polearm'), 'Pike'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Spears & Polearm'), 'Poleblade'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Spears & Polearm'), 'Staff'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Spears & Polearm'), 'Club');

-- Tipos dentro de Hammer & Axes
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Hammer & Axes'), 'Polehammer'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Hammer & Axes'), 'Poleaxe'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Hammer & Axes'), 'Dual Axes'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Hammer & Axes'), 'Dual Hammers');

-- Tipos dentro de Range Weapons
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Range Weapons'), 'Bow'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Range Weapons'), 'Crossbow'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Range Weapons'), 'Slingshot');

-- Tipos dentro de Gloves & Claws
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Gloves & Claws'), 'Fist'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Gloves & Claws'), 'Claw');

-- Tipos dentro de Whips
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Whips'), 'Whip');

-- Tipos dentro de Magical Instrument
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Magical Instrument'), 'Magic Sword'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Magical Instrument'), 'Wand'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Magical Instrument'), 'Glaive'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Magical Instrument'), 'Pataka');

-- Tipos dentro de Daggers
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Daggers'), 'Daggers');

-- Tipos dentro de Spheres
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Spheres'), 'Testing'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Spheres'), 'Spheres');

-- Tipos dentro de Saber
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Saber'), 'Saber');

-- Tipos dentro de Scythe
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Scythe'), 'Scythe');

-- Tipos dentro de Sword Shield
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Sword Shield'), 'Sword Shield');

-- Tipos dentro de Firearm
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Firearm'), 'Firearm');

-- Tipos dentro de Armors
-- Tipos dentro de Shirt
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Shirt'), 'Heavy Plate'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Shirt'), 'Light Armor'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Shirt'), 'Arcane Robe');

-- Tipos dentro de Pants
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Pants'), 'Heavy Leggings'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Pants'), 'Light Leggings'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Pants'), 'Arcane Leggings');

-- Tipos dentro de Footwear
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Footwear'), 'Heavy Footwear'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Footwear'), 'Light Footwear'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Footwear'), 'Arcane Footwear');

-- Tipos dentro de Helmet
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Helmet'), 'Arcane Headgear'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Helmet'), 'Helmet');

-- Tipos dentro de WristBracer
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='WristBracer'), 'Heavy Wristguards'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='WristBracer'), 'Light Wristguards'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='WristBracer'), 'Arcane Wristguards');

-- Tipos dentro de Manteau
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Manteau'), 'Robe');

-- Tipos dentro de Necklace
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Necklace'), 'Elemental Necklace'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Necklace'), 'Ethereal Necklace'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Necklace'), 'Protection Necklace');

-- Tipos dentro de Waist Adorn
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Waist Adorn'), 'Elemental Belt'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Waist Adorn'), 'Ethereal Belt'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Waist Adorn'), 'Protection Belt');

-- Tipos dentro de Ring
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Ring'), 'Might Ring'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Ring'), 'Magic Ring');

-- Tipos dentro de Add HP
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Add HP'), 'Healing Potion'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Add HP'), 'Life Powder'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Add HP'), 'Life Dust'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Add HP'), 'Gift Release'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Add HP'), 'N/A'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Add HP'), 'Vip Prestige Card');

-- Tipos dentro de Add MP
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Add MP'), 'Mana Potion'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Add MP'), 'Magic Powder'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Add MP'), 'Magic Dust'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Add MP'), 'Gift Release'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Add MP'), 'N/A'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Add MP'), 'Vip Prestige Card');

-- Tipos dentro de Add HP & MP
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Add HP & MP'), 'Rejuvenation Potion'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Add HP & MP'), 'Elixir Powder'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Add HP & MP'), 'Elixir Dust'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Add HP & MP'), 'Gift Release'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Add HP & MP'), 'N/A');

-- Tipos dentro de Detoxicate
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Detoxicate'), 'Antidote');

-- Tipos dentro de Instant Antidote
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Instant Antidote'), 'Antidote');

-- Subcategorias de Materials -> não possuem tipos (mantemos só as subcategorias)

-- Tipos dentro de Shop
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Shop'), 'New'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Shop'), 'S.Chart'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Shop'), 'Packs'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Shop'), 'Wedding'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Shop'), 'Pets'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Shop'), 'Home'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Shop'), 'Misc.');

-- Tipos dentro de Fashion (Item Mall)
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Fashion'), 'Shirts'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Fashion'), 'Trousers'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Fashion'), 'Boots'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Fashion'), 'Blouses'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Fashion'), 'Gloves'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Fashion'), 'Bottoms'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Fashion'), 'Heels'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Fashion'), 'Head'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Fashion'), 'F.W.');

-- Atualizando Star (agora com Star 6 também)
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Star'), 'Star 1'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Star'), 'Star 2'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Star'), 'Star 3'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Star'), 'Star 4'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Star'), 'Star 5'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Star'), 'Star 6');

-- Tipos dentro de Flyers
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Flyers'), 'Human'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Flyers'), 'Untamed'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Flyers'), 'Elves'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Flyers'), 'Tideborn'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Flyers'), 'E.guard'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Flyers'), 'N.shade'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Flyers'), 'Upgrade');

-- Tipos dentro de Ride
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Ride'), 'Beasts'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Ride'), 'Upgrade');

-- Chat -> não tem tipos (mantém só a subcategoria)

-- Tipos dentro de Utility
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Utility'), 'Combat'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Utility'), 'Storage'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Utility'), 'Portal'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Utility'), 'Resets'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Utility'), 'Pigment'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Utility'), 'Chat'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Utility'), 'Smiley');

-- Tipos dentro de Craft
INSERT INTO ItemTypes (subcategory_id, name) VALUES
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Craft'), 'Refine'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Craft'), 'Socket'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Craft'), 'Mats 1'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Craft'), 'Mats 2'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Craft'), 'Upgrade'),
((SELECT subcategory_id FROM ItemSubcategories WHERE name='Craft'), 'Fireworks');

-- Avatar Cards -> não possuem tipos
-- Destroyer, Battle, Longevity, Durability, Soulprime, Lifeprime ficam só como subcategorias

-- 📌 Correção da tabela Items
ALTER TABLE Items
ADD COLUMN level INT AFTER name,
ADD COLUMN lv INT AFTER level;

-- 📌 Script para renomear coluna
ALTER TABLE Items
CHANGE COLUMN lv LV INT;

-- Alterar a coluna para VARCHAR em vez de INT
ALTER TABLE Items MODIFY COLUMN LV VARCHAR(10);

-- 📌 Opção: Resetar completamente (zerar IDs também)
TRUNCATE TABLE Items;

-- INSERINDO OS TIPOS - Weapons - Swords & Blades - Blade
-- Itens pertencente ao Blade
INSERT INTO Items (type_id, name, level) VALUES
((SELECT type_id FROM ItemTypes WHERE name='Blade'), 'Without Name', 1),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), 'Without Name', 1),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), 'GM Test Blade', 1),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆GMEnd of Game Blade', 1),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Hawk Fight', 1),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Strider', 2),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Steel Falchion', 3),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Steel Falchion', 3),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Steel Falchion', 3),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Folded Iron Falchion', 9),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Folded Iron Falchion', 9),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Folded Iron Falchion', 9),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Wraithnob Falchion', 17),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Wraithnob Falchion', 17),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Wraithnob Falchion', 17),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Battle Falchion', 25),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Battle Falchion', 27),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Battle Falchion', 27),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Battle Falchion', 27),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Devastator Falchion', 35),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Devastator Falchion', 37),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Devastator Falchion', 37),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Devastator Falchion', 37),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), 'Without Name', 38),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Shady Blade', 42),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Juggernaut Falchion', 45),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Juggernaut Falchion', 47),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Juggernaut Falchion', 47),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Juggernaut Falchion', 47),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '0Blade of the Blood Wolf', 52),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Dust to Dust Falchion', 57),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Dust to Dust Falchion', 57),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Dust to Dust Falchion', 57),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Petrified Femur', 60),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Skinner Knife', 60),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Verdant Falchion', 67),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Verdant Falchion', 67),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Verdant Falchion', 67),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), 'Without Name', 70),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Bloodtooth Blade', 70),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Ghoulish Sword', 70),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Warriorblade', 70),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), 'Without Name', 75),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Clumsy Falchion', 77),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Clumsy Falchion', 77),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Clumsy Falchion', 77),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Fireflow, Blade of the Warrior', 80),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Dragonblade', 80),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Shinroblade', 80),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Forceblade', 80),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Cirruslord', 80),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Cirruslord', 80),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Cirruslord', 80),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Cirruslord', 80),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆GM - Cirruslord', 80),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆GM - Cirruslord', 80),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Chrono Breaker', 85),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Dimension Breaker', 85),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Heartless Falchion', 87),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Heartless Falchion', 87),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Heartless Falchion', 87),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Brahma''s Lash', 88),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), 'Without Name', 90),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Firelotus, Blade of the Dragon', 90),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Devilblade', 90),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Starless Black Blade', 90),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Ravager', 90),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Cavalier Scimitar', 90),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Heartless Smasher', 93),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), 'N/A10年5月男西式婚礼服纪念头发', 95),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), 'Without Name', 95),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), 'Without Name', 95),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Heartless Smasher', 95),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Montcouper', 97),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Montcouper', 97),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Montcouper', 97),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Mirage Scimitar', 99),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Scarlet Scimitar', 99),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Inferno-Heaven Ravager', 99),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Sacred Divinity', 99),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Dark Scimitar', 99),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Halfway Galaxy', 100),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Heartless Smasher', 100),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Solemn Darkness', 100),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Chilling Darkness', 100),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Blade of the King', 100),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Blade of the King', 100),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Inferno-Heaven Scimitar', 100),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Murderer of Shuras', 100),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Halfway Galaxy', 100),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Dimension Splitter', 100),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Wanderer Skiff', 100),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Scimitar of the King', 100),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Cold Prayer', 100),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Cold Prayer', 100),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆The King''s Heart', 100),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Cold Chant', 100),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Cold Chant', 100),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Cold Fortitude', 100),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Cold Ebony', 100),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), 'Skeletal Desolation', 105),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), 'Skeletal Oblivion', 105),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), 'Skeletal Evanescence', 105),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), 'Skeletal Ephemeral', 105),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), 'Skeletal Evanescence', 105),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Forged Crimson', 105),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Estoque', 107),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Estoque', 107),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Estoque', 107),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Will of the Arbiter', 109),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), 'Without Name', 110),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), 'Without Name', 115),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Earthstopper', 117),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Earthstopper', 117),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Earthstopper', 117),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Netherblade', 127),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Netherblade', 127),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Netherblade', 127),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Elegant Beauty', 129),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆Deer Slayer', 137),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆Deer Slayer', 137),
((SELECT type_id FROM ItemTypes WHERE name='Blade'), '☆☆☆Deer Slayer', 137);

-- INSERINDO OS TIPOS - Weapons - Swords & Blades - Sword
-- Itens pertencente ao Sword

INSERT INTO Items (type_id, name, level)
VALUES
((SELECT type_id FROM ItemTypes WHERE name='Sword'), 'Long Clipper', 1),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), 'N/A2012pk赛纪念_单剑 ID014', 1),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), 'Without Name', 1),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), 'Without Name', 1),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), 'Without Name', 1),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), 'Wooden Sword', 1),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), 'Without Name', 1),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), 'Earthguard Thinker Sword', 1),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Bronze Sword', 4),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Bronze Sword', 4),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆☆Bronze Sword', 4),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), 'Without Name', 5),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Perfect Military Claymore', 5),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Perfect·Military Longsword', 5),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Heavy Sword', 8),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Violet Corona Sword', 10),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆☆Iceblade Combat Sword', 10),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Tempered Iron Sword', 11),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Tempered Iron Sword', 11),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆☆Tempered Iron Sword', 11),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Refined Sword', 19),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Refined Sword', 19),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆☆Refined Sword', 19),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆☆Comet Sword', 19),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Perfect Officer''s Claymore', 20),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Nature''s Blade', 20),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Sword of Burning Clouds', 22),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), 'Without Name', 25),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Nature''s Blade', 29),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Nature''s Blade', 29),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆☆Nature''s Blade', 29),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Destroyer of the Realm', 30),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Frost Sword', 30),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆☆Angel''s Punisher', 30),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Frost Sword', 39),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Frost Sword', 39),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆☆Frost Sword', 39),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Sword of Loyalty', 40),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆☆Filial Sword', 40),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '0Sword of the Seal', 45),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Sword of Loyalty', 49),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Sword of Loyalty', 49),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆General Summer''s Claymore', 50),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Aquamarine Sword', 59),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Aquamarine Sword', 59),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆☆Aquamarine Sword', 59),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Illusive Lunar Cutlass', 61),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), 'Without Name', 65),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Rambler''s Sword', 69),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Rambler''s Sword', 69),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆☆Rambler''s Sword', 69),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Loyalty Sword', 70),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Sword of Secrets', 79),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Bright Mirror Sword', 79),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Sword of Secrets', 79),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆☆Sword of Secrets', 79),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), 'Without Name', 80),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), 'Without Name', 80),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Abyssal Sword', 80),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Crescentic Sharpness', 80),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Cost of Glory', 80),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆☆GM - Cost of Glory', 80),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆☆GM - Cost of Glory', 80),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Imperial Sword', 81),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), 'Without Name', 85),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Sword of Affection', 89),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Sword of Affection', 89),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆☆Sword of Affection', 89),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Moonlight''s End', 90),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Soaring Spirit Sword', 90),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), 'Without Name', 94),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), 'N/A10年5月沙漠判官男头发', 95),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), 'Without Name', 95),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), 'Without Name', 95),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Calamitous Claymore', 95),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Lamp of the Mind', 95),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Lamp of the Soul', 95),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆☆Moonlight''s End', 96),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), 'Without Name', 98),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Lonesky Blade', 99),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Lonesky Blade', 99),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆☆Lonesky Blade', 99),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Autumn Crescent', 100),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Moonlight', 100),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Ashura Meditation', 100),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Nightfall Lamp', 100),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Radiant Eye Sword', 100),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), 'Without Name', 101),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Sentient Broadsword', 101),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆☆Samsara Greatsword', 101),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆☆Sentient Claymore', 101),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Abyssal Dragon Blade', 109),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Abyssal Dragon Blade', 109),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆☆Abyssal Dragon Blade', 109),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), 'Without Name', 110),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Ursa Major Blade', 119),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Ursa Major Blade', 119),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Destroyer of the Realm', 119),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Sky Cutter', 129),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Sky Cutter', 129),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Blade of Noble Rampage', 129),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆☆Sky Cutter', 129),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆Deathbringer', 139),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆Deathbringer', 139),
((SELECT type_id FROM ItemTypes WHERE name='Sword'), '☆☆☆Deathbringer', 139);

-- INSERINDO OS TIPOS - Weapons - Swords & Blades - Dual Swords
-- Itens pertencente ao Dual Swords

INSERT INTO Items (type_id, name, level)
VALUES
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), 'Without Name', 1),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), 'Without Name', 1),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), 'GM Test Dual Swords', 1),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Mother and Son Blades', 1),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Bloody Justice Blades', 1),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Legacy Bloody Justice Blades', 1),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Politician Dual Swords', 1),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Ceremonial Swords', 1),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Mother and Son Blades', 1),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Mother and Son Blades', 1),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Inamorato Dual Sword', 5),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Inamorato Dual Sword', 5),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Inamorato Dual Sword', 5),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Noble Dual Swords', 10),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Linked Blades', 13),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Linked Blades', 13),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Linked Blades', 13),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Minister Dual Swords', 20),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Kan and Li', 20),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Yin and Yang', 21),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Yin and Yang', 21),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Yin and Yang', 21),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Divinity Ordain Dual Swords', 25),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Duke Dual Swords', 30),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Eagle''s Claw', 30),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Harmony Blades', 30),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Kan and Li', 31),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Kan and Li', 31),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Kan and Li', 31),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Blades of Flowing Gold', 40),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Royal Dual Swords', 40),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Harmony Blades', 41),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Harmony Blades', 41),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Harmony Blades', 41),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Devil Hunter''s Sword', 48),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Blades of Flowing Gold', 51),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Blades of Flowing Gold', 51),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Blades of Flowing Gold', 51),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Ember Leyline', 55),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Reflux Blades', 60),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Wings of Protection', 61),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Wings of Protection', 61),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Wings of Protection', 61),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Astral Extrication', 70),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Windflower Blades', 71),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Windflower Blades', 71),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Windflower Blades', 71),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Shinrotwins', 80),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Master''s Longsword', 80),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Crescentic Sharpness', 80),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Crescentic Sharpness', 80),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Cost of Glory', 80),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Crescentic Sharpness', 80),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Cost of Glory', 80),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Crescentic Sharpness', 80),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Violet Blades', 81),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Violet Blades', 81),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Violet Blades', 81),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Sacred Comprehension', 85),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Divine Comprehension', 85),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Skydance Quake', 85),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), 'Without Name', 90),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Dragon Seekers', 90),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Enlightenment', 90),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Dancing Butterfly Blades', 91),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Dancing Butterfly Blades', 91),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Dancing Butterfly Blades', 91),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Dragon''s Voyage', 92),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), 'N/A10年5月兔女郎装女头发', 95),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), 'Without Name', 95),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), 'Without Name', 95),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Violet Comet', 95),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Dragon''s Voyage', 97),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Dragonslayer of Annihilation', 99),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), 'Without Name', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Mindtrap Blades', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Dragon''s Voyage', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Infinite Longing', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Mindtrap Blades', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Late Frost', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Razor Fangs', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Arising Dragon', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Infinite Longing', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Dragon Seal', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Oblivion Memory', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Blade Fangs', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Skyward Fangs', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Mindtrap Blades', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Silverlight Fangs', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Vendetta Fangs', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Radiance', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Skyward Fangs', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Silverlight Fangs', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), 'N/A24品双剑_2011资料片资源未使用_图标待补', 101),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Moon and Stars', 101),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Moon and Stars', 101),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Crystallus Cleavers: Sky', 101),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Moon and Stars', 101),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Nirvana Greatsword', 101),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Penumbra: Bloodsoaked Wild', 101),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), 'Phantasmal Tone', 105),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), 'Apparitional Tone', 105),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), 'Otherworldly Tone', 105),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), 'Empyreal Tone', 105),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), 'Otherworldly Tone', 105),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Sol and Luna', 111),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Sol and Luna', 111),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Sol and Luna', 111),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Marital Bliss', 115),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Heaven and Earth', 121),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Heaven and Earth', 121),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Heaven and Earth', 121),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Morgan''s Cutlass', 129),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆Terra and Caelest', 131),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆Terra and Caelest', 131),
((SELECT type_id FROM ItemTypes WHERE name='Dual Swords'), '☆☆☆Terra and Caelest', 131);

-- INSERINDO OS TIPOS - Weapons - Swords & Blades - Dual Blades
-- Itens pertencente ao Dual Blades

INSERT INTO Items (type_id, name, level)
VALUES
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), 'Without Name', 1),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), 'Without Name', 1),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Frostflame Falchions', 1),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Orange Blade', 1),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Willow Leaf Blades', 2),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆Willow Leaf Blades', 2),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆☆Willow Leaf Blades', 2),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Butterfly Blades', 7),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆Butterfly Blades', 7),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆☆Butterfly Blades', 7),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Dual Mithril Blades', 14),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Coalition Blades', 15),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆Coalition Blades', 15),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆☆Coalition Blades', 15),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), 'Without Name', 20),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Ringchain Blades', 24),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆Ringchain Blades', 24),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆☆Ringchain Blades', 24),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Meridian Blades', 25),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Meridian Blades', 34),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆Meridian Blades', 34),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆☆Meridian Blades', 34),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Sawtooth Blades', 35),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Sawtooth Blades', 44),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆Sawtooth Blades', 44),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆☆Sawtooth Blades', 44),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), 'Without Name', 45),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Bloodthirsty Blades', 45),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Bloodthirsty Blades', 54),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆Bloodthirsty Blades', 54),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆☆Bloodthirsty Blades', 54),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Twin Sight Blades', 64),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆Twin Sight Blades', 64),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆☆Twin Sight Blades', 64),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Moonsnow Blades', 74),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆Moonsnow Blades', 74),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆☆Moonsnow Blades', 74),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Laughing Spirit Blades', 84),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆Laughing Spirit Blades', 84),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆☆Laughing Spirit Blades', 84),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆Fins of Antiquity', 91),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆The Two Lovers', 94),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆The Two Lovers', 94),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆☆The Two Lovers', 94),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), 'Without Name', 95),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), 'N/A10年5月西式婚礼服纪念女头发', 95),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), 'Without Name', 95),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Unbent One', 95),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Unbowed One', 95),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆☆Fins of Antiquity', 96),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Demonic Rebuttal', 98),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Darkslayers of Obliteration', 99),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), 'Without Name', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Astral Ballad', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Fins of Antiquity', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆Ultimate Darkness', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆Astral Ballad', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆Dark Vanishment', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆Phoenix Frenzy', 100),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Water and Cloud', 104),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆Water and Cloud', 104),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆☆Water and Cloud', 104),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Hate Banishers', 114),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆Hate Banishers', 114),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆☆Hate Banishers', 114),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆Gemini Blades', 119),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Visage Defenders', 124),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆Visage Defenders', 124),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆☆Visage Defenders', 124),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆Kris of Antiquity', 129),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆Ebb and Flow', 134),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆Ebb and Flow', 134),
((SELECT type_id FROM ItemTypes WHERE name='Dual Blades'), '☆☆☆Ebb and Flow', 134);

-- INSERINDO OS TIPOS - Weapons - Spears & Polearms - Pike
-- Itens pertencente ao Pike

INSERT INTO Items (type_id, name, level)
VALUES
((SELECT type_id FROM ItemTypes WHERE name='Pike'), 'Without Name', 1),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), 'Without Name', 1),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), 'GM Test Pike', 1),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Legacy Swordsman Long Spear', 1),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Partisan of Peace', 1),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Swordsman Long Spear', 1),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Steel Spear', 3),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Steel Spear', 3),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Steel Spear', 3),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Giant Spear', 8),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Giant Spear', 8),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Giant Spear', 8),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), 'Without Name', 13),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Silver Spear', 16),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Silver Spear', 16),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Silver Spear', 16),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Viper Spear', 25),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Viper Spear', 25),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Viper Spear', 25),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Springsource Spear', 35),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Springsource Spear', 35),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Springsource Spear', 35),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '0Tombguard Spear', 45),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Furnace Spear', 45),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Furnace Spear', 45),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Furnace Spear', 45),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Pear Blossom Spear', 55),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Pear Blossom Spear', 55),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Pear Blossom Spear', 55),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), 'Without Name', 60),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Petrified Lance', 60),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Skeletal Spear', 60),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Goose Down Spear', 65),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Goose Down Spear', 65),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Goose Down Spear', 65),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Backstab Piercer', 70),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Jaden Spear', 70),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Helm Piercing Spear', 75),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Helm Piercing Spear', 75),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Helm Piercing Spear', 75),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Sawbone Javelin', 80),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Radiant Jade Heart', 80),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Demon Heart', 80),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Dragonlance', 80),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Heroic Pride', 80),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆GM - Heroic Pride', 80),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Heroic Pride', 80),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Heroic Pride', 80),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Heroic Pride', 80),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆GM - Heroic Pride', 80),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), 'Outer Heaven', 85),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Dancing Dragon Spear', 85),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Pride of Heaven', 85),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Outer Heaven', 85),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Dancing Dragon Spear', 85),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Dancing Dragon Spear', 85),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Soul Swallower', 90),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Raging Lion', 90),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Desert Thrust', 90),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Raging Dragonlance', 90),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Shatterstar', 90),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆The Stern King', 90),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Warrior of Destiny', 92),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), 'Without Name', 93),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), 'N/A魔时装女裤子配方', 95),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), 'Without Name', 95),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), 'Without Name', 95),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Voidflash Spear', 95),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Voidflash Spear', 95),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Voidflash Spear', 95),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Warrior of Destiny', 96),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), 'Without Name', 99),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Dragon''s Bite', 99),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Wrathsoul', 99),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Behemoth Femur', 99),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Shadowmancer''s Arm', 99),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Whitesands Spear', 99),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Monarch Spear', 99),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Warrior of Destiny', 100),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Galaxy Shocker', 100),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Blasting Strider', 100),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Cloudclaw', 100),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Voidrider''s Touch', 100),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Ocean of Clouds', 100),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Galaxy Shocker', 100),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Pale Desert', 100),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Sonar Break', 100),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Wandering Strider', 100),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Martial Strider', 100),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Wandering Strider', 100),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Crushing Strider', 100),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Forest Strider', 100),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Crushing Strider', 100),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Salvific Spear: Sky', 101),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), 'Waning Reflection', 105),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), 'Surging Reflection', 105),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), 'Water Breaker', 105),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), 'Exploding Reflection', 105),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), 'Surging Reflection', 105),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Bloodrain Spear', 105),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Bloodrain Spear', 105),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Bloodrain Spear', 105),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Rampager', 109),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), 'Without Name', 115),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Rainbow Spear', 115),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Rainbow Spear', 115),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Rainbow Spear', 115),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Sunsmash Spear', 125),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Sunsmash Spear', 125),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Sunsmash Spear', 125),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Returning Dawn', 129),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆Xiang Yu''s Spear', 135),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆Xiang Yu''s Spear', 135),
((SELECT type_id FROM ItemTypes WHERE name='Pike'), '☆☆☆Xiang Yu''s Spear', 135);

-- INSERINDO OS TIPOS - Weapons - Spears & Polearms - Poleblade
-- Itens pertencente ao Poleblade

INSERT INTO Items (type_id, name, level)
VALUES
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), 'Without Name', 1),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), 'Without Name', 1),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Worn Glaive', 1),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Heaven''s Forge', 1),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Worn Glaive', 1),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆☆Worn Glaive', 1),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Leaf Cutter', 6),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Leaf Cutter', 6),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆☆Leaf Cutter', 6),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Chopping Scythe', 13),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Chopping Scythe', 13),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆☆Chopping Scythe', 13),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), 'Without Name', 15),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆☆Trial Scythe', 19),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Crescent Moon Scythe', 20),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Steedslayer Scythe', 22),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Steedslayer Scythe', 22),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆☆Steedslayer Scythe', 22),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Phoenix Beak Scythe', 30),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Crescent Moon Scythe', 32),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Crescent Moon Scythe', 32),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆☆Crescent Moon Scythe', 32),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Brow Scythe', 40),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆☆Bloodstained Battle Scythe', 40),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Phoenix Beak Scythe', 42),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Phoenix Beak Scythe', 42),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆☆Phoenix Beak Scythe', 42),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Sound Chaser', 51),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Brow Scythe', 52),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Brow Scythe', 52),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆☆Brow Scythe', 52),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Silver Carp Scythe', 62),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Silver Carp Scythe', 62),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆☆Silver Carp Scythe', 62),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Flame Scythe', 70),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Elephant Trunk Scythe', 72),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Elephant Trunk Scythe', 72),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆☆Elephant Trunk Scythe', 72),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Massive Champion', 78),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Ifrit of Wrath', 80),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Vicious Scythe', 80),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Spring and Autumn Scythe', 82),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Spring and Autumn Scythe', 82),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆☆Spring and Autumn Scythe', 82),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Advancing Truth', 85),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Solid Truth', 85),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Evil Eye', 90),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Beaconfire', 90),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Warflame Scythe', 92),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Warflame Scythe', 92),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆☆Warflame Scythe', 92),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Gleaming Windfall', 93),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), 'N/A魔时装女上衣配方', 95),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), 'Without Name', 95),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), 'Without Name', 95),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Dance of Nature', 95),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Dance of the Universe', 95),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆☆Gleaming Windfall', 99),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Gleaming Windfall', 100),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Waves of the Glacier', 100),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Scythe of the King', 100),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Trailess Blood', 100),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Waves of the Glacier', 100),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Cyan Massacre', 100),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Tidal Sorrow', 100),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Spear of the King', 100),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆☆The King''s Fury', 100),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Disaster Scythe', 102),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Disaster Scythe', 102),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆☆Disaster Scythe', 102),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Undoubted Existence', 105),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Braden''s Burner', 109),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Ghostrage Scythe', 112),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Ghostrage Scythe', 112),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆☆Ghostrage Scythe', 112),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Absolution', 119),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Mighty Scythe', 122),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Mighty Scythe', 122),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆☆Mighty Scythe', 122),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆Judgment Day Scythe', 132),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆Judgment Day Scythe', 132),
((SELECT type_id FROM ItemTypes WHERE name='Poleblade'), '☆☆☆Judgment Day Scythe', 132);


-- Se quiser guardar texto descritivo em value
ALTER TABLE Items MODIFY COLUMN value TEXT;
ALTER TABLE Items MODIFY COLUMN value INT;

-- 📌 Ajuste da tabela
ALTER TABLE Items MODIFY COLUMN value TEXT;
ALTER TABLE Items MODIFY COLUMN description TEXT;
ALTER TABLE Items MODIFY COLUMN rarity TEXT;

-- 📌 Exemplo de preenchimento para Without Name
INSERT INTO Items (type_id, name, level, description)
VALUES (
  (SELECT type_id FROM ItemTypes WHERE name='Blade'),
  'Without Name',
  1,
  'Used by character(s): Seeker, Cleric, Archer, Assassin, Barbarian, Venomancer, Psychic, Wizard, Blademaster'
);

-- 📌 Opção: Excluir apenas esse registro
DELETE FROM Items
WHERE item_id = 123;

-- Se quiser apagar vários itens de uma vez, pode usar:
DELETE FROM Items WHERE item_id IN (123, 124, 125);

-- Se quiser limpar tudo e recomeçar, use:
TRUNCATE TABLE Items;

-- 📌 Script para excluir as colunas
ALTER TABLE items
DROP COLUMN description,
DROP COLUMN LV,
DROP COLUMN value,
DROP COLUMN rarity;

-- 📌 SQL para listar todas as referências (foreign keys)
SELECT 
    TABLE_NAME AS tabela_origem,
    COLUMN_NAME AS coluna_origem,
    CONSTRAINT_NAME AS nome_restricao,
    REFERENCED_TABLE_NAME AS tabela_referenciada,
    REFERENCED_COLUMN_NAME AS coluna_referenciada
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE REFERENCED_TABLE_NAME IS NOT NULL
  AND TABLE_SCHEMA = 'pw-database';

-- 📌 Ver a estrutura completa das tabelas
SHOW CREATE TABLE ItemCategories;
SHOW CREATE TABLE Items;
SHOW CREATE TABLE ItemSubCategories;
SHOW CREATE TABLE ItemTypes;

-- 📌 Gerar um diagrama ER (texto)
SELECT 
    CONCAT(
        TABLE_NAME, '.', COLUMN_NAME, 
        ' → ', 
        REFERENCED_TABLE_NAME, '.', REFERENCED_COLUMN_NAME
    ) AS relacionamento
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE REFERENCED_TABLE_NAME IS NOT NULL
  AND TABLE_SCHEMA = 'pw-database';

-- Guardar a imagem binária
ALTER TABLE items
ADD COLUMN icon BLOB AFTER item_id;

-- Guardar o caminho do ícone
ALTER TABLE items
MODIFY COLUMN icon VARCHAR(255) AFTER item_id;

-- Exemplo de INSERT:
INSERT INTO items (item_id)
VALUES (1, 'E:\\MYSQL WORKBENCH - SQL SCRIPT\\Icones\\Weapons\\Swords & Blades\\Blade\\Without Name.png');

-- Exemplo de UPDATE:
UPDATE items
SET icon = 'E:\\MYSQL WORKBENCH - SQL SCRIPT\\Icones\\Weapons\\Swords & Blades\\Blade\\☆☆☆Steel Falchion'
WHERE item_id = 10;

-- Inserindo um novo caminho
UPDATE items
SET icon = 'C:/Users/Giovani Chaves/OneDrive/Documentos/NetBeansProjects/Perfect_World/Icones/Weapons/Swords & Blades/Blade/☆☆☆Steel Falchion'
WHERE item_id = 10;
