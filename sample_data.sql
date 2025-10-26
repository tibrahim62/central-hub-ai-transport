-- sample_data.sql
-- Minimal seed data

INSERT INTO shipments (route_code, origin_city, destination_city, departed_at, arrived_at, status) VALUES
('RTE-1001','Orlando','Tampa', SYSTIMESTAMP-7, SYSTIMESTAMP-6, 'Delivered');

INSERT INTO shipments (route_code, origin_city, destination_city, departed_at, status) VALUES
('RTE-2002','Miami','Jacksonville', SYSTIMESTAMP-2, 'In-Transit');

INSERT INTO shipment_incidents (shipment_id, occurred_at, severity, description) VALUES
(1, SYSTIMESTAMP-6.5, 'Low',  'Driver reported minor delay due to traffic on I-4.');

INSERT INTO shipment_incidents (shipment_id, occurred_at, severity, description) VALUES
(1, SYSTIMESTAMP-6.8, 'Medium','Temperature sensor warning; brief door open at dock.');

INSERT INTO shipment_incidents (shipment_id, occurred_at, severity, description) VALUES
(2, SYSTIMESTAMP-1.5, 'High',  'Mechanical issue: tire pressure loss detected; assisted stop on highway.');

COMMIT;
