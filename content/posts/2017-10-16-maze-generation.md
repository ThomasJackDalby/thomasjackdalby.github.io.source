---
title:  "Maze Generation"
date:   "2017-10-16"
---

Over the past few months I've been experimenting a fair amount with procedural generation. It started out from an interest in Roguelikes (a genre of RPG, check out the [subreddit](www.reddit.com/r/roguelikedev)) but has expanded into a variety of more general areas, one of which is "maze generation".

I've found that there is quite a selection of different approaches for procedural maze generation. In this blog post I'll cover just the two that I proto-typed, but keep in mind this only scratches the surface of the available methods out there.

### Depth-first search.

The depth-first search algorithm takes a single walker, who randomly walks in a grid of cells. It can be thought of as a miner digging a series of tunnels, but keeping a map such that he never digs back into a tunnel he's already dug.

If he digs himself into a cell which has already has tunnels behind the other three walls, he walks back along the tunnel to the first cell which has a wall which does not back onto a tunnel, and carries on with his random digging.

![Depth first](/maze_generation/depth_1.gif){: .center-image }

This approach works pretty well, however has a tendency to produce long tunnels with little branching, as branching only occurs when longer tunnels get stuck.

### Other search

This approach is a bit different. At each step of the algorithm, a walker takes a random path around the grid of cells, keeping track of where they have walked. If they walk onto a spot they've already walked on, they "forget" all the path they've walked since that spot, and then continue on. If they walk onto a spot they walked on during a previous path 

![Random walking](/maze_generation/walk_1.gif){: .center-image }