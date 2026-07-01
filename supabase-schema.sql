-- FisioFit Zaragoza
-- Ejecutar en Supabase SQL Editor.

create table if not exists public.fisiofit_app_state (
  id text primary key default 'main',
  data jsonb not null default '{"patients":[],"consents":[]}'::jsonb,
  updated_at timestamptz not null default now(),
  updated_by uuid references auth.users(id)
);

alter table public.fisiofit_app_state enable row level security;

drop policy if exists "Usuarios autenticados pueden leer FisioBonos" on public.fisiofit_app_state;
drop policy if exists "Usuarios autenticados pueden crear FisioBonos" on public.fisiofit_app_state;
drop policy if exists "Usuarios autenticados pueden actualizar FisioBonos" on public.fisiofit_app_state;
drop policy if exists "Usuarios autenticados pueden borrar FisioBonos" on public.fisiofit_app_state;
drop policy if exists "Usuarios autenticados pueden leer FisioFit" on public.fisiofit_app_state;
drop policy if exists "Usuarios autenticados pueden crear FisioFit" on public.fisiofit_app_state;
drop policy if exists "Usuarios autenticados pueden actualizar FisioFit" on public.fisiofit_app_state;
drop policy if exists "Usuarios autenticados pueden borrar FisioFit" on public.fisiofit_app_state;

create policy "Usuarios autenticados pueden leer FisioFit"
on public.fisiofit_app_state
for select
to authenticated
using (true);

create policy "Usuarios autenticados pueden crear FisioFit"
on public.fisiofit_app_state
for insert
to authenticated
with check ((select auth.uid()) = updated_by);

create policy "Usuarios autenticados pueden actualizar FisioFit"
on public.fisiofit_app_state
for update
to authenticated
using (true)
with check ((select auth.uid()) = updated_by);

create policy "Usuarios autenticados pueden borrar FisioFit"
on public.fisiofit_app_state
for delete
to authenticated
using (true);

-- Opcional para sincronización en tiempo real entre tablets.
-- Si Supabase indica que ya está añadido a la publicación, puedes ignorar ese aviso.
alter publication supabase_realtime add table public.fisiofit_app_state;
