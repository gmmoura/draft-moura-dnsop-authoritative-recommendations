#Reviews DNSOP

## [RF:MSJ1]
   * src: msj@nthpermutation.com

```
Do you have any authoritative server operators that have signed on to these 
recommendations other than the authors?  if not, I’d suggest deferring this as a 
WG document pending some buy in from a few ops that are using these 
recommendations and can provide some real world context.  E.g. how does research 
translate to reality here?
```

   * Action: Paul Ebersman will read it  -- "t. $DAYJOB includes gTLD, ccTLD and 
second level domains (Neustar)."

## [RF:TG1]

    * src: ximaera@gmail.com

```
> 5. R4 [..]
>  -  It can withdraw or pre-prepend its route to some or to all of its
>      neighbors, shrinking its catchment (the number of clients that BGP
>      maps to it), shifting both legitimate and attack traffic to other
>      anycast sites.  The other sites will hopefully have greater
>      capacity and be able to service the queries.

Not necessarily so.
First, one can (may?) use BGP communities to limit the route
announcement propagation, thus making the distribution between sites
more even.
Second, Flowspec/DOTS/selective BH/et cetera.
```

   * Action: 

## [RF:TG2]

    * src: ximaera@gmail.com
```
   > 6. R5 [..]

Shouldn't we wait before the faith of draft-ietf-dnsop-serve-stale is
determined? The outcome of this one may be then heavily influenced.

Anyway, it's not quite clear what this section suggests. Should I set
the TTL to 10s? What are the consequences of that? How's that related
to my threat model?
```

## [RF:TG3]

    * src: ximaera@gmail.com
```
> 2: R1 [..]
(yes, out of order)

Well, *one* (and there may be more) of the reasons to maintain
authoritative servers with uneven latency distribution may be to have
a) some fast servers you can afford to get brought down by a DDoS
attack, b) a "lightning rod" — a purposefully degraded absorber,
mentioned in (5).
```

## [RF:TG4]

    * src: ximaera@gmail.com


```
   > 2: R1 [..]
> But the distribution of queries tend to be skewed towards authoritatives with 
lower

There's a reason for that that you may want to mention, namely, smoothed RTT.
```

## [RF:JAb1]

   * src: jabley@hopcount.ca

```
I have read this document. This is not a detailed review, just a more general 
reaction to the adoption question.

This document reads a bit like it wants to give operational advice but in fact 
it seems much more like a literature review that has been culturally adapted to 
an IETF audience. This is not intended to be a negative comment; I think the 
references and the context are useful and I think it's a great idea to find a 
way to push pointers to operational research into the RFC series, but I think it 
would be as well to make it clear that the operational advice contained within 
is not comprehensive and in many cases is quite superficial. I can give examples 
if you want more detail.
```

## [RF:JAb2]

   * src: jabley@hopcount.ca

```
I also think that the document is not clear on what problem it is solving; in 
particular, it doesn't define "performance". It's inferred that the performance 
metric that matters is round-trip query latency for some nominal client at an 
average distance; what if the operator's priority is availability? That makes R1 
potentially bad advice; no doubt there are other motivations that would also not 
fit the recommendations convincingly.
```

## [RF:JAb3]

   * src: jabley@hopcount.ca
   
```
Much of the document is specifically concerned with the implementation of 
anycast strategies for DNS, not with authoritative DNS in particular. The advice 
would hold for any stateless (or short-duration transaction, where short is 
relative to routing stability). One direction the authors might consider taking 
this is to update the advice in RFC 4786 with reference to the repeatable 
experiments that you cite. Ironically 4786 was criticised for being a document 
about DNS that was pretending to be more general; perhaps when welded to your 
document the result would be more pleasantly neutral 
```
## [RF: JLev1]

   * src: johnl@taugh.com

```

I run authoritative servers for about 500 small domains, but I suspect
I am not the operator you are looking for.

Perhaps a next step would be to clarify what kind of server operators
this advice is intended for, or perhaps different parts of it are
intended for different kinds of operators.  I doubt I will ever use
anycast, but the advice on latency and TTL might be useful to my
smallish setup.

```
   * Action: fixed

## [RF: DW1]
 
   * src: dwessels@verisign.com 
 

```
The intro says "DNS queries contributes to web latency" and this rubs me the 
wrong way for a number of reasons.  (1) why call out "web" specifically here?  
DNS does not discriminate in its latency.  (2) DNS queries *could* contribute to 
latency, but caching is designed to really reduce it.  (3) I think its unhelpful 
to focus to much on latency beyond a certain point.  That is to say, there are 
latencies that matter (on the order of 1 second) but 40ms vs 20ms probably 
doesn't matter at all.  If the DNS folks keep saying that latency is king, then 
the HTTP folks will implement resolverless DNS.
```


## [RF: DW2]
 
   * src: dwessels@verisign.com 
 

```

Section 2. "All authoritative servers should have similar latency" -- to what?  
This section is going to be tricky, as proven by Wes's xxx comments. 

Section 2 says "Nameserver replication is recommended for all zones" and I'm 
struggling with exactly what nameserver replication refers to here.  Does it 
mean "have more than one"  or does it mean "replicate the data to all 
instances".  I guess when I see the word replication I think of data.

Section 2 ends with a note about .nl formerly being mixed unicast/anycast.  That 
feels like a separate subject to me, the tradeoffs between all unicast, mixed 
unicast/anycast, and all anycast.
```

## [RF: DW3]
 
   * src: dwessels@verisign.com 
 
```
Section 6 say TTLs are "set by authoritative server operators".  In fact they 
are set by the zone publisher.  In many cases they are the same entity, but not 
always.   Obviously USC/ISI as operator of a root server does not set the root 
zone TTLs.
```
## [RF: DW4]
 
   * src: dwessels@verisign.com 


```
Lastly, I'm inclined to agree with Mike St John's point about having input from 
other operators.  Many of the examples provided here are from root and TLD 
operations and it's not obvious to me that those should necessarily apply more 
broadly to all authoritative operators.
```
   * Action:  duplicate [MSJ1]