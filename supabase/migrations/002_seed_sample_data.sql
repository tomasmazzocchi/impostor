-- Seed sample categories and words
-- This migration inserts the same sample data that was hardcoded in the app

-- Insert categories (approved by default for seed data)
INSERT INTO categories (id, name, description, approved) VALUES
('00000000-0000-0000-0000-000000000001', 'Animals', 'Different types of animals', true),
('00000000-0000-0000-0000-000000000002', 'Food', 'Various food items', true),
('00000000-0000-0000-0000-000000000003', 'Countries', 'Countries around the world', true)
ON CONFLICT (id) DO NOTHING;

-- Insert words for Animals category
INSERT INTO words (id, category_id, word, approved) VALUES
('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', 'Dog', true),
('00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 'Cat', true),
('00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000001', 'Elephant', true),
('00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000001', 'Lion', true)
ON CONFLICT (id) DO NOTHING;

-- Insert words for Food category
INSERT INTO words (id, category_id, word, approved) VALUES
('00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000002', 'Pizza', true),
('00000000-0000-0000-0000-000000000006', '00000000-0000-0000-0000-000000000002', 'Burger', true),
('00000000-0000-0000-0000-000000000007', '00000000-0000-0000-0000-000000000002', 'Pasta', true),
('00000000-0000-0000-0000-000000000008', '00000000-0000-0000-0000-000000000002', 'Sushi', true)
ON CONFLICT (id) DO NOTHING;
