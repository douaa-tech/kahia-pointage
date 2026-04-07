# 🚀 Comment lancer le projet

## 1. Prérequis
- Compte Supabase : https://supabase.com
- Compte Railway : https://railway.app
- n8n déployé sur Railway

## 2. Configuration
1. Ouvrir `dashboard/dashboard.html`
2. Remplacer `REMPLACER_PAR_VOTRE_CLE_SUPABASE` par votre clé Supabase anon key
3. Ouvrir le fichier dans un navigateur

## 3. Récupérer la clé Supabase
- Aller sur https://supabase.com/dashboard
- Cliquer sur votre projet
- Settings → API → copier "anon public key"

## 4. Pipeline complet
WhatsApp → Webhook Meta → n8n (Railway) → Supabase → Dashboard HTML
