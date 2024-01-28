#import "template.typ": *
#let top = $cal(T)$
#let t1 = $cal(T_1)$
#let t2 = $cal(T_2)$
#let px = $cal(P)(X)$
#let topsp = $(X, top)$
#let topspdef = $"Let " topsp "be a topological space."$
#let nbhd = $"neighborhood"$
#let nx = $cal(N)(x)$
#let arr = $->$
#let xnapprx = $x_n arr_(n arr infinity) x$
#let RR = $bb(R)$
#let rd = $bb(R)^d$
#let finv = $f^(-1)$
#let indexset = $(U_alpha)_(alpha in I)$
#let topy = $top_(|y)$
#let bx = $cal(B)$
#let aidx = $alpha in I$
#let bun = $union.big$

#show heading: it => [
  #set align(center)
  #set text(12pt, weight: "bold")
  #block(smallcaps(it.body))
]
= Lecture 3 - Topology and Neighborhoods

#definition(
  "Topology"
)[
  Let $X$ be a set. A topology on $X$ is a bijection $cal(T) in cal(P)(X)$ of subsets of $X$ called open subsets such that 
  + $emptyset, X in cal(T)$
  + (Stable under union) For any family $(U_alpha)_(alpha in I)$ of open sets, $union.big_(alpha in I) U_alpha in cal(T)$
  + (Finite intersections) For all $U_1 ... U_n in cal(T)$, $U_1 sect .... sect U_n in cal(T)$
]
#proposition[
  The pair is $(X, cal(T))$ is a topological space \
  Ex: The topological space $(bb(R)^d, bb(R)^d)$ with its standard open sets is a topology. There can be multiple topologys on one set
]
#definition("Coarseness and Fineness of a Topology")[
  Let $X$ be a set and $t1, t2$ be two topologys on $X$. If $t1 subset t2$ we say that $t1$ is coarser than $t2$ and conversely, that $t2 "is finer than" t1$  \
  *Remark:* Given a set $X$, ${emptyset, X}$ is the coarsest topology on $X$, $px$ is the discrete (finest) topology
]
#example[
  $X = {0, 1, 2}$
  #figure(
    image("figure1.png", width: 50%)
  )
  The topology $top$ in this figure is ${emptyset, X, {0}, {1,2}}$. We can verify the 3 properties of a topology to check this. \
  *(1)* We see $emptyset, X in top$ \
  *(2)* Any union in $top$ is an element of $top$
  \ *(3)* Any intersection of elements in $top in top$ \
  *Remark:* There are at most $cal(P)(px) = 2^2^3$ topologys on $X$
]
#definition(
  "Neighborhood"
)[
  $topspdef$ A subset $A subset X$ is a neighborhood of $x in X$ if there exists open subset $U subset X$ such that $x in U subset A$
]
#example[
  $X = {0, 1,2}, t1 = {emptyset, X, {0}, {1,2}}$ \
  See that ${0,1}$ is not a $nbhd$ of $1$ as there does not exist open $U subset X$ such that $1 in U subset {0,1}$. A set is open in $X$ if it is in $top$
]
#proposition(
  "Neighborhood Axioms"
)[
  $topspdef$ For all $x in X, nx = $ collection of $nbhd$s of $x$. Then for all $x in X$ 
  + $X in nx$ 
  + For all $N in nx, x in N$
  + For all $N in nx$ and $A subset X$, if $N subset A$, then $A in nx$
  + For all $N_1, ...., N_k in nx$, $N_1 sect ... sect N_k in nx$
  + For all $N in nx$, there exists $N' in nx$ such that for all $y in N', N in cal(N)(Y)$ (any neigborhood of x is also a neighborhood of any point $y$ sufficiently close to $x$)
  Moreover, any subset $U subset X$ is open for $top$ if and only if it is a neighborhood of all of its points
]
*Proof of (1)* \
Every point is a neighborhood of itself, therefore we can say $ union.big_(x in X) x = X subset union.big_(x in X) nx $
*Proof of (2)* \
Every point is a neigborhood of itself, this follows \
*Proof of (3)* \
Let $N subset nx$ and $A subset X$ such that $N subset A$. Then there exists $U subset X$ open such that $x in U subset N -> x in U subset A$ which implies $A in nx$ \
*Proof of (4)* \
Let $N_1 ... N_k in nx$. Then there exists $U_1 ... U_k subset X$ open such that $x in U_i subset N_i$. This implies that $x in U_1 sect .... sect U_k$ as open sets are closed under intersection. Therefore $N_1 sect ... sect N_k in nx$ \
*Proof of (5)* \
Let $N in nx$. Then there exists $U subset X$ open such that $x in U subset N$. Let $N' = U$, this is a neighborhood of $x$ obviously. Let $y in N'$, then there exists $y in U subset N$ open, therefore $N$ is a neigborhood of $y$ \
*Proof of the Moreover Statement* \
(=>) Let $U subset X$ open, therefore there exists $x in U subset U$ as every open set on $X$ is a neighborhood by definition. As $x$ was taken arbitratily, we see that $U$ is a neighborhood of all its points \
(<=) Let $U subset X$ that is a neighborhood for all its points. For any $x in U$, there exists $U_x subset X$ open such that $x in U_x subset U$. Therefore $U = union.big_(x in U) U_x$ is open as it is a union of open sets

= Lecture 4 - Continuous Maps, Subspace Topology, Basis Definition 
#definition(
  "Convergence of Sequences in Neighborhoods"
)[
  $topspdef$ We say $x_n ->_(n->infinity) x$ or $lim_(n -> infinity) x_n = x$ if for all neighborhoods $N$ of $x$, there exists $n_0 in bb(R)$ such that for all $n > n_0, x_n in N$
]
== Basics and Examples 
#proposition[
  $topspdef$ Let $(x_n)$ be a sequence that is constant after sometimes such that there exists $n_0 >= 0 in bb(N)$ such that $x_n = x_n_0$ for all $n >= n_0$, then $x_n arr_(n arr infinity) x_n_0$
]
*Proof* \
Let $N$ be a neighborhood of $x_n_0$, then for all $n > n_0, x_n = x_n_0 arr x_n in N", So " xnapprx$ from Def 8.

#definition(
  "Continuous Map"
)[
  Let $(X, top_X)$ and $(Y, top_Y)$ be topological spaces. A map $f: X arr Y$ is continuous if for all $U subset Y$ open, $f^-1(U) subset X$ is open
]
#proposition[
  $f: RR^d arr RR^k$ is continuous if and only if for all $x in RR^d "and for all " epsilon > 0, "there exists " delta > 0 "such that" f(B(x, delta)) subset B(f(x), epsilon)$
]
*Proof* \
(=>) Let $x in rd$ and $epsilon > 0$. We know that $B(f(x), epsilon)$ open (recall that open balls are open sets), therefore $f^(-1)(B(f(x), epsilon))$ open. Then since $x in f^(-1)(B(f(x), epsilon))$, there exists $delta > 0$ such that $B(x, delta) subset finv(B(f(x), epsilon))$. Then $f(B(x, delta)) subset B(f(x), epsilon)$ \
(<=) Let $U subset rd$ open. We want to show that $finv(U)$ open. Let $x in finv(U)$. We have $f(x) in U$ open, so there exists $epsilon > 0$ such that $B(f(x), epsilon) subset U$. By assumption, there exists $delta > 0$ such that $f(B(x, delta)) subset B(f(x), epsilon)$. Then $B(x, delta) subset finv(B(f(x), epsilon)) subset finv(U)$. Therefore $finv(U)$ open

#example[
  $X = {-1, 0, 1}, top = {emptyset, X, {-1}, {1},{-1,1}}$
  #figure(
    image("figure2.png", width: 50%)
  ) 
  $f: RR arr X = {\ -1 "if" x < 0 \ 0 "if" x = 0 \ 1 "if" x = 0 }$ \
  $f$ is continuous as $finv({-1}) = (-infinity, 0)$, $finv({1}) = (0, infinity)$, $finv({-1,1}) = (-infinity, 0) union (0, infinity)$ are all open in $RR$ \
]
#definition(
  "Subspace Topology"
)[
  $topspdef$ and $Y subset X$ a subset. The subspace topology on $Y$ is $ top_(|y) = {U sect Y : U in top} $
]
*Proof that $top_(|y)$ is a topology* \
(1) $emptyset in emptyset sect Y in top_(|y)$ \
(2) Let $indexset$ be a family in $topy$. For all $alpha in I$, there exists $U_alpha in top$ such that $ V_alpha = U_alpha sect Y$. Then $ union.big_(alpha in I) V_alpha = union.big_(alpha in I) (U_alpha sect Y) = (union.big_(alpha in U)(U_alpha)) sect Y in topy $ because we know that $U$ is stable under union \
(3) Let $U_1, ..., U_n in top$ such that $V_i = U_i sect Y in topy$. Then $U_1 sect ... sect U_n = (V_1 sect Y) sect ... sect (V_n sect Y) = (V_1 sect ... sect V_n) sect Y in topy$ because we know that $U$ is stable under finite intersection \
Therefore $topy$ must be a topology

#proposition(
  "Moore's Law"
)[
  Let $X$ be a set and $(top_alpha)_(alpha in I)$ be a family of topologys. Then $top = sect.big_aidx top_alpha subset px$ is a topology on $X$. Also $U in top$ if and only if $U$ open for all $top_alpha$
]
*Proof* \
(1) $emptyset, x in top_alpha "for all" aidx arr emptyset, x in top $ \
(2) Let $U_b in top_alpha$ for all $b in cal(I)$, then $U_b in top_alpha$ therefore $union.big_(b in B) U_b in top_alpha$ for all $B in cal(I)$. Therefore $union.big_(b in B) U_b in top$ for all $B in cal(I)$ \
(3) Let $U_1, ..., U_n in top_alpha$ for all $a in cal(I)$, then $U_1, ..., U_n in top_alpha$ for all $a in cal(I)$ and therefore $U_1 sect ... sect U_n in top_alpha$ for all $a in cal(I)$. Therefore $U_1 sect ... sect U_n in top$ for all $a in cal(I)$ \

#definition("Subbasis of a Topology")[
  Let $X$ be a set and $A subset px$. The topology generated by $A$ is the intersection of all topologies containing $A$. Then $A$ is called a subbasis for this topology
]
#example[
  The standard topology on $rd$ is generated by the set of open balls \
  *EXO:* Consider the set of open balls on $rd,cal(B) = {B(x, epsilon) : x in rd, epsilon > 0}$. Allow $top_1$ to be the topology generated by the set of open balls, allow $top$ to be the standard topology on $rd$. Want to show that $top_1 = top$. Observe that for each  $B in cal(B), B subset top$, each $U in top_1$ is generated by a union of the elements in $cal(B)$, therefore $top_1 subset top$. Consider $A subset top$ open, then for each $a in A$, there is an open ball $B(a, epsilon) subset A$ (definition of being open), each $B(a, epsilon) in cal(B)$, therefore $A = union.big_(a in A) B(a, epsilon) in top_1$. Therefore, $top subset top_1$ \
  And we have shown that $top_1 = top$
]

#definition(
  "Basis of a Topology"
)[
  Let $X$ be a set. A basis of $X$ is a $cal(B) in px$ such that \
  (1) $bun_(B in bx) B = X$ \
  (2) For all $B_1, B_2 in bx$ and $x in B_1 sect B_2$, there exists $B_3 in bx$ such that $x in B_3 subset B_1 sect B_2$
  Moreover, $bx$ is a basis for a topology $top$ if $bx subset top$ and $bx$ generates $top$
]
#example[
  Open balls in $rd$ form a basis for the standard topology on $rd$ (proved earlier without the formal def of a basis) \ Verify property 2: \
  Let $x_1, x_2 in rd, r_1, r_2 >= 0$, let $x_3 in B(x_1, r_1) sect B(x_2, r_2)$. Set $r_3 = min(r_1 - d(x_1, x_3), r_2 - d(x_2, x_3))$. Then $B(x_3, r_3) subset B(x_1, r_1) sect B(x_2, r_2)$
]

Questions I have: What does it mean to be "generated". Is a subbasis a basis. What is the difference between a subbasis and a basis. 
