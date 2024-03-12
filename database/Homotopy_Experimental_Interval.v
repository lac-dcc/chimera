(** This file is an adaptation of Peter Lumsdaine's definition of interval. *)

Add LoadPath "../UnivalentFoundations".

Require Import Homotopy.

(** Compatibility with Coq 8.2. *)

Unset Automatic Introduction.

(** Suppose we had a type Interval which looked like the usual closed interval, i.e., it had two
   points, a path between them and it satisfied the rules which say that paths in other spaces aries
   as images of the [Interval]. *)

(** printing ~~> $\leadsto$ *)
(** printing Interval $[0,1]$ #[0,1]# *)

Axiom Interval : Type.

(** The interval has two endpoints and a path between them. *)

(** printing zero $0$ #0# *)
(** printing one  $1$ #1# *)
(** printing segment  $\vec{01}$ #1# *)

Axiom zero : Interval.
Axiom one : Interval.
Axiom segment : zero ~~> one.

(** The following facts are missing from basic facts and needs to be added. *)

Definition path_transport {A} {P : A -> Type} {x y : A} (p : x ~~> y) {u v : P x} (q : u ~~> v) :
  transport p u ~~> transport p v.
Proof.
  path_induction.
Defined.

Definition dependent_map {A} {P : A -> Type} (f : forall x : A, P x) {x y : A} (p : x ~~> y) :
  transport p (f x) ~~> f y.
Proof.
  path_induction.
Defined.

Lemma self_transport_path A (x y : A) (p : x ~~> y) : transport (P := fun z => z ~~> y) p p ~~> idpath y.
Proof.
  path_induction.
Defined.

Lemma transport_in_trivial_fibration {A B} {x y : A} (p : x ~~> y) (u : B) :
  transport (P := fun _ => B) p u ~~> u.
Proof.
  path_induction.
Defined.

Lemma path_between {A} : contractible A -> forall x y : A, x ~~> y.
Proof.
  intros A [c p] x y.
  path_via c.
Defined.

(** As a warmup we first write down the non-dependent version of the interval, which state that path
   [p : a ~~> b] in [X] induces a function [Interval -> X] with desired properties. These are easier
   to understand than their dependent counterparts in which [X] is replaced by a fibration over
   [Interval]. *)

Axiom interval_path' : forall {X} {a b : X} (p : a ~~> b), Interval -> X.

Axiom interval_path_zero' : forall {X} {a b : X} (p : a ~~> b), interval_path' p zero ~~> a.

Axiom interval_path_one' : forall {X} {a b : X} (p : a ~~> b), interval_path' p one ~~> b.

Axiom interval_path_segment' : forall X (a b : X) (p : a ~~> b),
  !(interval_path_zero' p) @ map (interval_path' p) segment @ (interval_path_one' p) ~~> p.

(** The trouble with the above axioms is that they seem too weak to deduce that every point in
   [Interval] has a path from [zero] to it. We need a suitable dependent version. *)

Axiom interval_path : forall {P : Interval -> Type} {a : P zero} {b : P one} (p : transport segment a ~~> b),
  forall x : Interval, P x.

(** We should also write down how [interval_path] interacts with [zero], [one], and [segment], which
   we will in a momemnt. But first let us show that [interval_path] alone suffices to show thata
   [Interval] is contractible. *)

Theorem Interval_contractible : contractible Interval.
Proof.
  split with one.
  intro t.
  apply @interval_path with
    (P := fun x => x ~~> one) (a := segment) (b := idpath one).
  apply self_transport_path.
Defined.

(** The remaining axioms tell us how [interval_path] interacts with [zero], [one] and [segment]. *)

Axiom interval_path_zero : forall {P : Interval -> Type} {a : P zero} {b : P one} (p : transport segment a ~~> b),
  interval_path p zero ~~> a.

Axiom interval_path_one : forall {P : Interval -> Type} {a : P zero} {b : P one} (p : transport segment a ~~> b),
  interval_path p one ~~> b.

Axiom interval_path_segment : forall {P : Interval -> Type} {a : P zero} {b : P one} (p : transport segment a ~~> b),
  !(path_transport segment (interval_path_zero p)) @ dependent_map (interval_path p) segment @ interval_path_one p ~~> p.

(** Let us show that the interval enjoys and involution. *)

Definition twist : Interval -> Interval.
Proof.
Print interval_path.
  apply @interval_path with (a := one) (b := zero).
  path_via one.
  apply transport_in_trivial_fibration.
  exact (!segment).
Defined.

(** The following is a silly exercise since the interval is contractible. *)
Lemma twist_involution : forall t : Interval, twist (twist t) ~~> t.
Proof.
  intro t.
  destruct Interval_contractible as [c p].
  path_via c.
Defined.


