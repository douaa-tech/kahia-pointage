-- =============================================
-- SCHÉMA BASE DE DONNÉES — KAHIA-GENETHICAL
-- Supabase / PostgreSQL
-- =============================================

CREATE TABLE sites (
  id integer,
  nom text,
  lat numeric,
  lon numeric,
  rayon_m integer
);

CREATE TABLE employes (
  id integer,
  nom text,
  prenom text,
  telephone text,
  salaire_base numeric,
  planning_id integer,
  site_id integer,
  actif boolean,
  created_at timestamp without time zone
);

CREATE TABLE plannings (
  id integer,
  h1_entree time without time zone,
  h2_pause time without time zone,
  h3_reprise time without time zone,
  h4_sortie time without time zone,
  tolerance_mn integer
);

CREATE TABLE pointages (
  id bigint,
  telephone text,
  employe_id integer,
  lat numeric,
  lon numeric,
  distance_m integer,
  statut text,
  slot text,
  heure_reelle time without time zone,
  date_travail date
);

CREATE TABLE hs_manuel (
  id bigint,
  employe_id integer,
  hs_minutes integer,
  motif text,
  valide boolean,
  date_hs date,
  created_at timestamp without time zone
);

CREATE TABLE jours_feries (
  id integer,
  nom text,
  regle text,
  date_ferie date
);

CREATE TABLE deplacements (
  id bigint,
  employe_id integer,
  type_mission text,
  destination text,
  date_debut date,
  date_fin date,
  duree_jours integer,
  motif text,
  frais_hebergement integer
);

CREATE TABLE primes_employes (
  id bigint,
  employe_id integer,
  type_prime text,
  montant numeric,
  mois integer,
  annee integer
);

CREATE TABLE resume_mensuel (
  employe_id integer,
  mois integer,
  annee integer,
  jours_present integer,
  total_hs_mn integer,
  brut_total numeric,
  cnas_salarial numeric,
  irg numeric,
  net_a_payer numeric
);
CREATE TABLE IF NOT EXISTS journees_travail (
  id              bigserial PRIMARY KEY,
  telephone       text NOT NULL,
  date_travail    date NOT NULL,
  h1_arrivee      time,
  h2_depart_dej   time,
  h3_retour_dej   time,
  h4_depart_soir  time,
  duree_matin     numeric(5,2),
  duree_apmidi    numeric(5,2),
  duree_totale    numeric(5,2),
  statut_jour     text DEFAULT 'en_cours',
  created_at      timestamptz DEFAULT now(),
  updated_at      timestamptz DEFAULT now(),
  UNIQUE(telephone, date_travail)
);
