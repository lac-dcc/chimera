(** Basic definitions and theorems about equivalences. *)

Require Import HomotopyDefinitions.

(** For compatibility with Coq 8.2 we unset automatic parameter introduction. *)

Unset Automatic Introduction.

(** The identity map is an equivalence. *)

Definition idequiv A : equiv A A.
Proof.
  intro A.
  exists (idmap A).
  intros x.
  contract_hfiber x (idpath x).
  apply total_paths with (p := q).
  simpl.
  compute in q.
  path_induction.
Defined.

(** Every path between spaces gives an equivalence. *)

Definition path_to_equiv {U V} : U ~~> V -> equiv U V.
Proof.
  intros U v.
  intro p.
  induction p as [S].
  exact (idequiv S).
Defined.

(** From an equivalence from [U] to [V] we can extract a map in the inverse direction. *)

Definition equiv_inv {U V} : equiv U V -> (V -> U).
Proof.
  intros U V.
  intros [w H] y.
  destruct (H y) as [[x p] _].
  exact x.
Defined.

(** The extracted map in the inverse direction is actually an inverse (up to homotopy, of
   course). *)

Lemma equiv_inv_is_section U V (w : equiv U V) : forall y : V, w (equiv_inv w y) ~~> y.
Proof.
  intros U V w.
  intro y.
  destruct w as [w G].
  simpl.
  destruct (G y) as [[x p] c].
  exact p.
Defined.

Lemma equiv_inv_is_retraction U V (w : equiv U V) : forall x : U, (equiv_inv w (w x)) ~~> x.
Proof.
  intros U V w.
  intro x.
  destruct w as [w H].
  simpl.
  destruct (H (w x)) as [[y p] c].
  assert (q := c (existT _ x (idpath (w x)))).
  assert (r := base_path q).
  exact (!r).
Defined.

(** The last general fact about equivalences that we need is that they are injective
   on paths, which is not too surprising, given that they have sections. *)

Lemma equiv_injective U V : forall (w : equiv U V) x y, w x ~~> w y -> x ~~> y.
Proof.
  intros U V.
  intros w x y.
  simpl.
  intro p.
  assert (q := map (equiv_inv w) p).
  path_via (equiv_inv w (w x)).
  apply opposite; apply equiv_inv_is_retraction.
  path_via (equiv_inv w (w y)).
  apply equiv_inv_is_retraction.
Defined.

