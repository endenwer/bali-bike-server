module.exports = {
        typeDefs: /* GraphQL */ `type AggregateBike {
  count: Int!
}

type BatchPayload {
  count: Long!
}

type Bike {
  id: ID!
  modelId: Int!
  price: Int!
  photos: [String!]!
  rating: Float
  reviewsCount: Int
}

type BikeConnection {
  pageInfo: PageInfo!
  edges: [BikeEdge]!
  aggregate: AggregateBike!
}

input BikeCreateInput {
  modelId: Int!
  price: Int!
  photos: BikeCreatephotosInput
  rating: Float
  reviewsCount: Int
}

input BikeCreatephotosInput {
  set: [String!]
}

type BikeEdge {
  node: Bike!
  cursor: String!
}

enum BikeOrderByInput {
  id_ASC
  id_DESC
  modelId_ASC
  modelId_DESC
  price_ASC
  price_DESC
  rating_ASC
  rating_DESC
  reviewsCount_ASC
  reviewsCount_DESC
  createdAt_ASC
  createdAt_DESC
  updatedAt_ASC
  updatedAt_DESC
}

type BikePreviousValues {
  id: ID!
  modelId: Int!
  price: Int!
  photos: [String!]!
  rating: Float
  reviewsCount: Int
}

type BikeSubscriptionPayload {
  mutation: MutationType!
  node: Bike
  updatedFields: [String!]
  previousValues: BikePreviousValues
}

input BikeSubscriptionWhereInput {
  mutation_in: [MutationType!]
  updatedFields_contains: String
  updatedFields_contains_every: [String!]
  updatedFields_contains_some: [String!]
  node: BikeWhereInput
  AND: [BikeSubscriptionWhereInput!]
  OR: [BikeSubscriptionWhereInput!]
  NOT: [BikeSubscriptionWhereInput!]
}

input BikeUpdateInput {
  modelId: Int
  price: Int
  photos: BikeUpdatephotosInput
  rating: Float
  reviewsCount: Int
}

input BikeUpdateManyMutationInput {
  modelId: Int
  price: Int
  photos: BikeUpdatephotosInput
  rating: Float
  reviewsCount: Int
}

input BikeUpdatephotosInput {
  set: [String!]
}

input BikeWhereInput {
  id: ID
  id_not: ID
  id_in: [ID!]
  id_not_in: [ID!]
  id_lt: ID
  id_lte: ID
  id_gt: ID
  id_gte: ID
  id_contains: ID
  id_not_contains: ID
  id_starts_with: ID
  id_not_starts_with: ID
  id_ends_with: ID
  id_not_ends_with: ID
  modelId: Int
  modelId_not: Int
  modelId_in: [Int!]
  modelId_not_in: [Int!]
  modelId_lt: Int
  modelId_lte: Int
  modelId_gt: Int
  modelId_gte: Int
  price: Int
  price_not: Int
  price_in: [Int!]
  price_not_in: [Int!]
  price_lt: Int
  price_lte: Int
  price_gt: Int
  price_gte: Int
  rating: Float
  rating_not: Float
  rating_in: [Float!]
  rating_not_in: [Float!]
  rating_lt: Float
  rating_lte: Float
  rating_gt: Float
  rating_gte: Float
  reviewsCount: Int
  reviewsCount_not: Int
  reviewsCount_in: [Int!]
  reviewsCount_not_in: [Int!]
  reviewsCount_lt: Int
  reviewsCount_lte: Int
  reviewsCount_gt: Int
  reviewsCount_gte: Int
  AND: [BikeWhereInput!]
  OR: [BikeWhereInput!]
  NOT: [BikeWhereInput!]
}

input BikeWhereUniqueInput {
  id: ID
}

scalar Long

type Mutation {
  createBike(data: BikeCreateInput!): Bike!
  updateBike(data: BikeUpdateInput!, where: BikeWhereUniqueInput!): Bike
  updateManyBikes(data: BikeUpdateManyMutationInput!, where: BikeWhereInput): BatchPayload!
  upsertBike(where: BikeWhereUniqueInput!, create: BikeCreateInput!, update: BikeUpdateInput!): Bike!
  deleteBike(where: BikeWhereUniqueInput!): Bike
  deleteManyBikes(where: BikeWhereInput): BatchPayload!
}

enum MutationType {
  CREATED
  UPDATED
  DELETED
}

interface Node {
  id: ID!
}

type PageInfo {
  hasNextPage: Boolean!
  hasPreviousPage: Boolean!
  startCursor: String
  endCursor: String
}

type Query {
  bike(where: BikeWhereUniqueInput!): Bike
  bikes(where: BikeWhereInput, orderBy: BikeOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [Bike]!
  bikesConnection(where: BikeWhereInput, orderBy: BikeOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): BikeConnection!
  node(id: ID!): Node
}

type Subscription {
  bike(where: BikeSubscriptionWhereInput): BikeSubscriptionPayload
}
`
      }
    