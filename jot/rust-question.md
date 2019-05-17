# Rust Question

## 2019-05-17

I'm working on a project, and wasn't sure what the most rusty way to solve my problem is.

I have a `Population` of `Entity`s, each `Entity` has one `parent`, and many `children`. I need to both walk the tree structure, and iterate over every `Entity` in the `Population`. I also need to be able to (de)serialize the whole `Population`.

I originally thought of letting each `Entity` hold references to their `parent` and `children`:

```rust
// simplified example:
struct Entity<'a> {
   parent: &'a Entity,
   children: Vec<&'a Entity>,
}

type Population<'a> = Vec<Entity<'a>>;
```

But this doesn't play well with serde, and the lifetimes quickly became confusing.

My other idea was to assign each `Entity` an `Id`, and then perform lookups against a population:

```rust
struct Id(u64);

struct Entity {
   id: Id,
   parent_id: Id,
   children_id: Vec<Id>,
}

struct Population {
   entities: HashMap<Id, Entity>,
}

impl {
   pub fn get_entity_by_id(&self, &id: Id) -> &Entity;
}
```

Which seems pretty good, but it feels like I'm missing a trick. Is there some third, better, more rusty way anyone can think of?
