module.exports = {
        typeDefs: /* GraphQL */ `type AggregateBike {
  count: Int!
}

type AggregateBooking {
  count: Int!
}

type AggregateReview {
  count: Int!
}

type AggregateSavedBikesList {
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
  manufactureYear: Int
  mileage: Int
  reviews(where: ReviewWhereInput, orderBy: ReviewOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [Review!]
  bookings(where: BookingWhereInput, orderBy: BookingOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [Booking!]
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
  manufactureYear: Int
  mileage: Int
  reviews: ReviewCreateManyWithoutBikeInput
  bookings: BookingCreateManyWithoutBikeInput
}

input BikeCreateManyInput {
  create: [BikeCreateInput!]
  connect: [BikeWhereUniqueInput!]
}

input BikeCreateOneWithoutBookingsInput {
  create: BikeCreateWithoutBookingsInput
  connect: BikeWhereUniqueInput
}

input BikeCreateOneWithoutReviewsInput {
  create: BikeCreateWithoutReviewsInput
  connect: BikeWhereUniqueInput
}

input BikeCreatephotosInput {
  set: [String!]
}

input BikeCreateWithoutBookingsInput {
  modelId: Int!
  price: Int!
  photos: BikeCreatephotosInput
  rating: Float
  reviewsCount: Int
  manufactureYear: Int
  mileage: Int
  reviews: ReviewCreateManyWithoutBikeInput
}

input BikeCreateWithoutReviewsInput {
  modelId: Int!
  price: Int!
  photos: BikeCreatephotosInput
  rating: Float
  reviewsCount: Int
  manufactureYear: Int
  mileage: Int
  bookings: BookingCreateManyWithoutBikeInput
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
  manufactureYear_ASC
  manufactureYear_DESC
  mileage_ASC
  mileage_DESC
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
  manufactureYear: Int
  mileage: Int
}

input BikeScalarWhereInput {
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
  manufactureYear: Int
  manufactureYear_not: Int
  manufactureYear_in: [Int!]
  manufactureYear_not_in: [Int!]
  manufactureYear_lt: Int
  manufactureYear_lte: Int
  manufactureYear_gt: Int
  manufactureYear_gte: Int
  mileage: Int
  mileage_not: Int
  mileage_in: [Int!]
  mileage_not_in: [Int!]
  mileage_lt: Int
  mileage_lte: Int
  mileage_gt: Int
  mileage_gte: Int
  AND: [BikeScalarWhereInput!]
  OR: [BikeScalarWhereInput!]
  NOT: [BikeScalarWhereInput!]
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

input BikeUpdateDataInput {
  modelId: Int
  price: Int
  photos: BikeUpdatephotosInput
  rating: Float
  reviewsCount: Int
  manufactureYear: Int
  mileage: Int
  reviews: ReviewUpdateManyWithoutBikeInput
  bookings: BookingUpdateManyWithoutBikeInput
}

input BikeUpdateInput {
  modelId: Int
  price: Int
  photos: BikeUpdatephotosInput
  rating: Float
  reviewsCount: Int
  manufactureYear: Int
  mileage: Int
  reviews: ReviewUpdateManyWithoutBikeInput
  bookings: BookingUpdateManyWithoutBikeInput
}

input BikeUpdateManyDataInput {
  modelId: Int
  price: Int
  photos: BikeUpdatephotosInput
  rating: Float
  reviewsCount: Int
  manufactureYear: Int
  mileage: Int
}

input BikeUpdateManyInput {
  create: [BikeCreateInput!]
  update: [BikeUpdateWithWhereUniqueNestedInput!]
  upsert: [BikeUpsertWithWhereUniqueNestedInput!]
  delete: [BikeWhereUniqueInput!]
  connect: [BikeWhereUniqueInput!]
  disconnect: [BikeWhereUniqueInput!]
  deleteMany: [BikeScalarWhereInput!]
  updateMany: [BikeUpdateManyWithWhereNestedInput!]
}

input BikeUpdateManyMutationInput {
  modelId: Int
  price: Int
  photos: BikeUpdatephotosInput
  rating: Float
  reviewsCount: Int
  manufactureYear: Int
  mileage: Int
}

input BikeUpdateManyWithWhereNestedInput {
  where: BikeScalarWhereInput!
  data: BikeUpdateManyDataInput!
}

input BikeUpdateOneRequiredWithoutBookingsInput {
  create: BikeCreateWithoutBookingsInput
  update: BikeUpdateWithoutBookingsDataInput
  upsert: BikeUpsertWithoutBookingsInput
  connect: BikeWhereUniqueInput
}

input BikeUpdateOneRequiredWithoutReviewsInput {
  create: BikeCreateWithoutReviewsInput
  update: BikeUpdateWithoutReviewsDataInput
  upsert: BikeUpsertWithoutReviewsInput
  connect: BikeWhereUniqueInput
}

input BikeUpdatephotosInput {
  set: [String!]
}

input BikeUpdateWithoutBookingsDataInput {
  modelId: Int
  price: Int
  photos: BikeUpdatephotosInput
  rating: Float
  reviewsCount: Int
  manufactureYear: Int
  mileage: Int
  reviews: ReviewUpdateManyWithoutBikeInput
}

input BikeUpdateWithoutReviewsDataInput {
  modelId: Int
  price: Int
  photos: BikeUpdatephotosInput
  rating: Float
  reviewsCount: Int
  manufactureYear: Int
  mileage: Int
  bookings: BookingUpdateManyWithoutBikeInput
}

input BikeUpdateWithWhereUniqueNestedInput {
  where: BikeWhereUniqueInput!
  data: BikeUpdateDataInput!
}

input BikeUpsertWithoutBookingsInput {
  update: BikeUpdateWithoutBookingsDataInput!
  create: BikeCreateWithoutBookingsInput!
}

input BikeUpsertWithoutReviewsInput {
  update: BikeUpdateWithoutReviewsDataInput!
  create: BikeCreateWithoutReviewsInput!
}

input BikeUpsertWithWhereUniqueNestedInput {
  where: BikeWhereUniqueInput!
  update: BikeUpdateDataInput!
  create: BikeCreateInput!
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
  manufactureYear: Int
  manufactureYear_not: Int
  manufactureYear_in: [Int!]
  manufactureYear_not_in: [Int!]
  manufactureYear_lt: Int
  manufactureYear_lte: Int
  manufactureYear_gt: Int
  manufactureYear_gte: Int
  mileage: Int
  mileage_not: Int
  mileage_in: [Int!]
  mileage_not_in: [Int!]
  mileage_lt: Int
  mileage_lte: Int
  mileage_gt: Int
  mileage_gte: Int
  reviews_every: ReviewWhereInput
  reviews_some: ReviewWhereInput
  reviews_none: ReviewWhereInput
  bookings_every: BookingWhereInput
  bookings_some: BookingWhereInput
  bookings_none: BookingWhereInput
  AND: [BikeWhereInput!]
  OR: [BikeWhereInput!]
  NOT: [BikeWhereInput!]
}

input BikeWhereUniqueInput {
  id: ID
}

type Booking {
  id: ID!
  userUid: String!
  startDate: DateTime!
  endDate: DateTime!
  deliveryLocationLongitude: String!
  deliveryLocationLongitudeDelta: String!
  deliveryLocationLatitude: String!
  deliveryLocationLatitudeDelta: String!
  deliveryLocationAddress: String!
  deliveryLocationComment: String
  status: BookingStatus!
  bike: Bike!
}

type BookingConnection {
  pageInfo: PageInfo!
  edges: [BookingEdge]!
  aggregate: AggregateBooking!
}

input BookingCreateInput {
  userUid: String!
  startDate: DateTime!
  endDate: DateTime!
  deliveryLocationLongitude: String!
  deliveryLocationLongitudeDelta: String!
  deliveryLocationLatitude: String!
  deliveryLocationLatitudeDelta: String!
  deliveryLocationAddress: String!
  deliveryLocationComment: String
  status: BookingStatus
  bike: BikeCreateOneWithoutBookingsInput!
}

input BookingCreateManyWithoutBikeInput {
  create: [BookingCreateWithoutBikeInput!]
  connect: [BookingWhereUniqueInput!]
}

input BookingCreateWithoutBikeInput {
  userUid: String!
  startDate: DateTime!
  endDate: DateTime!
  deliveryLocationLongitude: String!
  deliveryLocationLongitudeDelta: String!
  deliveryLocationLatitude: String!
  deliveryLocationLatitudeDelta: String!
  deliveryLocationAddress: String!
  deliveryLocationComment: String
  status: BookingStatus
}

type BookingEdge {
  node: Booking!
  cursor: String!
}

enum BookingOrderByInput {
  id_ASC
  id_DESC
  userUid_ASC
  userUid_DESC
  startDate_ASC
  startDate_DESC
  endDate_ASC
  endDate_DESC
  deliveryLocationLongitude_ASC
  deliveryLocationLongitude_DESC
  deliveryLocationLongitudeDelta_ASC
  deliveryLocationLongitudeDelta_DESC
  deliveryLocationLatitude_ASC
  deliveryLocationLatitude_DESC
  deliveryLocationLatitudeDelta_ASC
  deliveryLocationLatitudeDelta_DESC
  deliveryLocationAddress_ASC
  deliveryLocationAddress_DESC
  deliveryLocationComment_ASC
  deliveryLocationComment_DESC
  status_ASC
  status_DESC
  createdAt_ASC
  createdAt_DESC
  updatedAt_ASC
  updatedAt_DESC
}

type BookingPreviousValues {
  id: ID!
  userUid: String!
  startDate: DateTime!
  endDate: DateTime!
  deliveryLocationLongitude: String!
  deliveryLocationLongitudeDelta: String!
  deliveryLocationLatitude: String!
  deliveryLocationLatitudeDelta: String!
  deliveryLocationAddress: String!
  deliveryLocationComment: String
  status: BookingStatus!
}

input BookingScalarWhereInput {
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
  userUid: String
  userUid_not: String
  userUid_in: [String!]
  userUid_not_in: [String!]
  userUid_lt: String
  userUid_lte: String
  userUid_gt: String
  userUid_gte: String
  userUid_contains: String
  userUid_not_contains: String
  userUid_starts_with: String
  userUid_not_starts_with: String
  userUid_ends_with: String
  userUid_not_ends_with: String
  startDate: DateTime
  startDate_not: DateTime
  startDate_in: [DateTime!]
  startDate_not_in: [DateTime!]
  startDate_lt: DateTime
  startDate_lte: DateTime
  startDate_gt: DateTime
  startDate_gte: DateTime
  endDate: DateTime
  endDate_not: DateTime
  endDate_in: [DateTime!]
  endDate_not_in: [DateTime!]
  endDate_lt: DateTime
  endDate_lte: DateTime
  endDate_gt: DateTime
  endDate_gte: DateTime
  deliveryLocationLongitude: String
  deliveryLocationLongitude_not: String
  deliveryLocationLongitude_in: [String!]
  deliveryLocationLongitude_not_in: [String!]
  deliveryLocationLongitude_lt: String
  deliveryLocationLongitude_lte: String
  deliveryLocationLongitude_gt: String
  deliveryLocationLongitude_gte: String
  deliveryLocationLongitude_contains: String
  deliveryLocationLongitude_not_contains: String
  deliveryLocationLongitude_starts_with: String
  deliveryLocationLongitude_not_starts_with: String
  deliveryLocationLongitude_ends_with: String
  deliveryLocationLongitude_not_ends_with: String
  deliveryLocationLongitudeDelta: String
  deliveryLocationLongitudeDelta_not: String
  deliveryLocationLongitudeDelta_in: [String!]
  deliveryLocationLongitudeDelta_not_in: [String!]
  deliveryLocationLongitudeDelta_lt: String
  deliveryLocationLongitudeDelta_lte: String
  deliveryLocationLongitudeDelta_gt: String
  deliveryLocationLongitudeDelta_gte: String
  deliveryLocationLongitudeDelta_contains: String
  deliveryLocationLongitudeDelta_not_contains: String
  deliveryLocationLongitudeDelta_starts_with: String
  deliveryLocationLongitudeDelta_not_starts_with: String
  deliveryLocationLongitudeDelta_ends_with: String
  deliveryLocationLongitudeDelta_not_ends_with: String
  deliveryLocationLatitude: String
  deliveryLocationLatitude_not: String
  deliveryLocationLatitude_in: [String!]
  deliveryLocationLatitude_not_in: [String!]
  deliveryLocationLatitude_lt: String
  deliveryLocationLatitude_lte: String
  deliveryLocationLatitude_gt: String
  deliveryLocationLatitude_gte: String
  deliveryLocationLatitude_contains: String
  deliveryLocationLatitude_not_contains: String
  deliveryLocationLatitude_starts_with: String
  deliveryLocationLatitude_not_starts_with: String
  deliveryLocationLatitude_ends_with: String
  deliveryLocationLatitude_not_ends_with: String
  deliveryLocationLatitudeDelta: String
  deliveryLocationLatitudeDelta_not: String
  deliveryLocationLatitudeDelta_in: [String!]
  deliveryLocationLatitudeDelta_not_in: [String!]
  deliveryLocationLatitudeDelta_lt: String
  deliveryLocationLatitudeDelta_lte: String
  deliveryLocationLatitudeDelta_gt: String
  deliveryLocationLatitudeDelta_gte: String
  deliveryLocationLatitudeDelta_contains: String
  deliveryLocationLatitudeDelta_not_contains: String
  deliveryLocationLatitudeDelta_starts_with: String
  deliveryLocationLatitudeDelta_not_starts_with: String
  deliveryLocationLatitudeDelta_ends_with: String
  deliveryLocationLatitudeDelta_not_ends_with: String
  deliveryLocationAddress: String
  deliveryLocationAddress_not: String
  deliveryLocationAddress_in: [String!]
  deliveryLocationAddress_not_in: [String!]
  deliveryLocationAddress_lt: String
  deliveryLocationAddress_lte: String
  deliveryLocationAddress_gt: String
  deliveryLocationAddress_gte: String
  deliveryLocationAddress_contains: String
  deliveryLocationAddress_not_contains: String
  deliveryLocationAddress_starts_with: String
  deliveryLocationAddress_not_starts_with: String
  deliveryLocationAddress_ends_with: String
  deliveryLocationAddress_not_ends_with: String
  deliveryLocationComment: String
  deliveryLocationComment_not: String
  deliveryLocationComment_in: [String!]
  deliveryLocationComment_not_in: [String!]
  deliveryLocationComment_lt: String
  deliveryLocationComment_lte: String
  deliveryLocationComment_gt: String
  deliveryLocationComment_gte: String
  deliveryLocationComment_contains: String
  deliveryLocationComment_not_contains: String
  deliveryLocationComment_starts_with: String
  deliveryLocationComment_not_starts_with: String
  deliveryLocationComment_ends_with: String
  deliveryLocationComment_not_ends_with: String
  status: BookingStatus
  status_not: BookingStatus
  status_in: [BookingStatus!]
  status_not_in: [BookingStatus!]
  AND: [BookingScalarWhereInput!]
  OR: [BookingScalarWhereInput!]
  NOT: [BookingScalarWhereInput!]
}

enum BookingStatus {
  WAITING_CONFIRMATION
  CONFIRMED
  CANCELED
}

type BookingSubscriptionPayload {
  mutation: MutationType!
  node: Booking
  updatedFields: [String!]
  previousValues: BookingPreviousValues
}

input BookingSubscriptionWhereInput {
  mutation_in: [MutationType!]
  updatedFields_contains: String
  updatedFields_contains_every: [String!]
  updatedFields_contains_some: [String!]
  node: BookingWhereInput
  AND: [BookingSubscriptionWhereInput!]
  OR: [BookingSubscriptionWhereInput!]
  NOT: [BookingSubscriptionWhereInput!]
}

input BookingUpdateInput {
  userUid: String
  startDate: DateTime
  endDate: DateTime
  deliveryLocationLongitude: String
  deliveryLocationLongitudeDelta: String
  deliveryLocationLatitude: String
  deliveryLocationLatitudeDelta: String
  deliveryLocationAddress: String
  deliveryLocationComment: String
  status: BookingStatus
  bike: BikeUpdateOneRequiredWithoutBookingsInput
}

input BookingUpdateManyDataInput {
  userUid: String
  startDate: DateTime
  endDate: DateTime
  deliveryLocationLongitude: String
  deliveryLocationLongitudeDelta: String
  deliveryLocationLatitude: String
  deliveryLocationLatitudeDelta: String
  deliveryLocationAddress: String
  deliveryLocationComment: String
  status: BookingStatus
}

input BookingUpdateManyMutationInput {
  userUid: String
  startDate: DateTime
  endDate: DateTime
  deliveryLocationLongitude: String
  deliveryLocationLongitudeDelta: String
  deliveryLocationLatitude: String
  deliveryLocationLatitudeDelta: String
  deliveryLocationAddress: String
  deliveryLocationComment: String
  status: BookingStatus
}

input BookingUpdateManyWithoutBikeInput {
  create: [BookingCreateWithoutBikeInput!]
  delete: [BookingWhereUniqueInput!]
  connect: [BookingWhereUniqueInput!]
  disconnect: [BookingWhereUniqueInput!]
  update: [BookingUpdateWithWhereUniqueWithoutBikeInput!]
  upsert: [BookingUpsertWithWhereUniqueWithoutBikeInput!]
  deleteMany: [BookingScalarWhereInput!]
  updateMany: [BookingUpdateManyWithWhereNestedInput!]
}

input BookingUpdateManyWithWhereNestedInput {
  where: BookingScalarWhereInput!
  data: BookingUpdateManyDataInput!
}

input BookingUpdateWithoutBikeDataInput {
  userUid: String
  startDate: DateTime
  endDate: DateTime
  deliveryLocationLongitude: String
  deliveryLocationLongitudeDelta: String
  deliveryLocationLatitude: String
  deliveryLocationLatitudeDelta: String
  deliveryLocationAddress: String
  deliveryLocationComment: String
  status: BookingStatus
}

input BookingUpdateWithWhereUniqueWithoutBikeInput {
  where: BookingWhereUniqueInput!
  data: BookingUpdateWithoutBikeDataInput!
}

input BookingUpsertWithWhereUniqueWithoutBikeInput {
  where: BookingWhereUniqueInput!
  update: BookingUpdateWithoutBikeDataInput!
  create: BookingCreateWithoutBikeInput!
}

input BookingWhereInput {
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
  userUid: String
  userUid_not: String
  userUid_in: [String!]
  userUid_not_in: [String!]
  userUid_lt: String
  userUid_lte: String
  userUid_gt: String
  userUid_gte: String
  userUid_contains: String
  userUid_not_contains: String
  userUid_starts_with: String
  userUid_not_starts_with: String
  userUid_ends_with: String
  userUid_not_ends_with: String
  startDate: DateTime
  startDate_not: DateTime
  startDate_in: [DateTime!]
  startDate_not_in: [DateTime!]
  startDate_lt: DateTime
  startDate_lte: DateTime
  startDate_gt: DateTime
  startDate_gte: DateTime
  endDate: DateTime
  endDate_not: DateTime
  endDate_in: [DateTime!]
  endDate_not_in: [DateTime!]
  endDate_lt: DateTime
  endDate_lte: DateTime
  endDate_gt: DateTime
  endDate_gte: DateTime
  deliveryLocationLongitude: String
  deliveryLocationLongitude_not: String
  deliveryLocationLongitude_in: [String!]
  deliveryLocationLongitude_not_in: [String!]
  deliveryLocationLongitude_lt: String
  deliveryLocationLongitude_lte: String
  deliveryLocationLongitude_gt: String
  deliveryLocationLongitude_gte: String
  deliveryLocationLongitude_contains: String
  deliveryLocationLongitude_not_contains: String
  deliveryLocationLongitude_starts_with: String
  deliveryLocationLongitude_not_starts_with: String
  deliveryLocationLongitude_ends_with: String
  deliveryLocationLongitude_not_ends_with: String
  deliveryLocationLongitudeDelta: String
  deliveryLocationLongitudeDelta_not: String
  deliveryLocationLongitudeDelta_in: [String!]
  deliveryLocationLongitudeDelta_not_in: [String!]
  deliveryLocationLongitudeDelta_lt: String
  deliveryLocationLongitudeDelta_lte: String
  deliveryLocationLongitudeDelta_gt: String
  deliveryLocationLongitudeDelta_gte: String
  deliveryLocationLongitudeDelta_contains: String
  deliveryLocationLongitudeDelta_not_contains: String
  deliveryLocationLongitudeDelta_starts_with: String
  deliveryLocationLongitudeDelta_not_starts_with: String
  deliveryLocationLongitudeDelta_ends_with: String
  deliveryLocationLongitudeDelta_not_ends_with: String
  deliveryLocationLatitude: String
  deliveryLocationLatitude_not: String
  deliveryLocationLatitude_in: [String!]
  deliveryLocationLatitude_not_in: [String!]
  deliveryLocationLatitude_lt: String
  deliveryLocationLatitude_lte: String
  deliveryLocationLatitude_gt: String
  deliveryLocationLatitude_gte: String
  deliveryLocationLatitude_contains: String
  deliveryLocationLatitude_not_contains: String
  deliveryLocationLatitude_starts_with: String
  deliveryLocationLatitude_not_starts_with: String
  deliveryLocationLatitude_ends_with: String
  deliveryLocationLatitude_not_ends_with: String
  deliveryLocationLatitudeDelta: String
  deliveryLocationLatitudeDelta_not: String
  deliveryLocationLatitudeDelta_in: [String!]
  deliveryLocationLatitudeDelta_not_in: [String!]
  deliveryLocationLatitudeDelta_lt: String
  deliveryLocationLatitudeDelta_lte: String
  deliveryLocationLatitudeDelta_gt: String
  deliveryLocationLatitudeDelta_gte: String
  deliveryLocationLatitudeDelta_contains: String
  deliveryLocationLatitudeDelta_not_contains: String
  deliveryLocationLatitudeDelta_starts_with: String
  deliveryLocationLatitudeDelta_not_starts_with: String
  deliveryLocationLatitudeDelta_ends_with: String
  deliveryLocationLatitudeDelta_not_ends_with: String
  deliveryLocationAddress: String
  deliveryLocationAddress_not: String
  deliveryLocationAddress_in: [String!]
  deliveryLocationAddress_not_in: [String!]
  deliveryLocationAddress_lt: String
  deliveryLocationAddress_lte: String
  deliveryLocationAddress_gt: String
  deliveryLocationAddress_gte: String
  deliveryLocationAddress_contains: String
  deliveryLocationAddress_not_contains: String
  deliveryLocationAddress_starts_with: String
  deliveryLocationAddress_not_starts_with: String
  deliveryLocationAddress_ends_with: String
  deliveryLocationAddress_not_ends_with: String
  deliveryLocationComment: String
  deliveryLocationComment_not: String
  deliveryLocationComment_in: [String!]
  deliveryLocationComment_not_in: [String!]
  deliveryLocationComment_lt: String
  deliveryLocationComment_lte: String
  deliveryLocationComment_gt: String
  deliveryLocationComment_gte: String
  deliveryLocationComment_contains: String
  deliveryLocationComment_not_contains: String
  deliveryLocationComment_starts_with: String
  deliveryLocationComment_not_starts_with: String
  deliveryLocationComment_ends_with: String
  deliveryLocationComment_not_ends_with: String
  status: BookingStatus
  status_not: BookingStatus
  status_in: [BookingStatus!]
  status_not_in: [BookingStatus!]
  bike: BikeWhereInput
  AND: [BookingWhereInput!]
  OR: [BookingWhereInput!]
  NOT: [BookingWhereInput!]
}

input BookingWhereUniqueInput {
  id: ID
}

scalar DateTime

scalar Long

type Mutation {
  createBike(data: BikeCreateInput!): Bike!
  updateBike(data: BikeUpdateInput!, where: BikeWhereUniqueInput!): Bike
  updateManyBikes(data: BikeUpdateManyMutationInput!, where: BikeWhereInput): BatchPayload!
  upsertBike(where: BikeWhereUniqueInput!, create: BikeCreateInput!, update: BikeUpdateInput!): Bike!
  deleteBike(where: BikeWhereUniqueInput!): Bike
  deleteManyBikes(where: BikeWhereInput): BatchPayload!
  createBooking(data: BookingCreateInput!): Booking!
  updateBooking(data: BookingUpdateInput!, where: BookingWhereUniqueInput!): Booking
  updateManyBookings(data: BookingUpdateManyMutationInput!, where: BookingWhereInput): BatchPayload!
  upsertBooking(where: BookingWhereUniqueInput!, create: BookingCreateInput!, update: BookingUpdateInput!): Booking!
  deleteBooking(where: BookingWhereUniqueInput!): Booking
  deleteManyBookings(where: BookingWhereInput): BatchPayload!
  createReview(data: ReviewCreateInput!): Review!
  updateReview(data: ReviewUpdateInput!, where: ReviewWhereUniqueInput!): Review
  updateManyReviews(data: ReviewUpdateManyMutationInput!, where: ReviewWhereInput): BatchPayload!
  upsertReview(where: ReviewWhereUniqueInput!, create: ReviewCreateInput!, update: ReviewUpdateInput!): Review!
  deleteReview(where: ReviewWhereUniqueInput!): Review
  deleteManyReviews(where: ReviewWhereInput): BatchPayload!
  createSavedBikesList(data: SavedBikesListCreateInput!): SavedBikesList!
  updateSavedBikesList(data: SavedBikesListUpdateInput!, where: SavedBikesListWhereUniqueInput!): SavedBikesList
  updateManySavedBikesLists(data: SavedBikesListUpdateManyMutationInput!, where: SavedBikesListWhereInput): BatchPayload!
  upsertSavedBikesList(where: SavedBikesListWhereUniqueInput!, create: SavedBikesListCreateInput!, update: SavedBikesListUpdateInput!): SavedBikesList!
  deleteSavedBikesList(where: SavedBikesListWhereUniqueInput!): SavedBikesList
  deleteManySavedBikesLists(where: SavedBikesListWhereInput): BatchPayload!
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
  booking(where: BookingWhereUniqueInput!): Booking
  bookings(where: BookingWhereInput, orderBy: BookingOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [Booking]!
  bookingsConnection(where: BookingWhereInput, orderBy: BookingOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): BookingConnection!
  review(where: ReviewWhereUniqueInput!): Review
  reviews(where: ReviewWhereInput, orderBy: ReviewOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [Review]!
  reviewsConnection(where: ReviewWhereInput, orderBy: ReviewOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): ReviewConnection!
  savedBikesList(where: SavedBikesListWhereUniqueInput!): SavedBikesList
  savedBikesLists(where: SavedBikesListWhereInput, orderBy: SavedBikesListOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [SavedBikesList]!
  savedBikesListsConnection(where: SavedBikesListWhereInput, orderBy: SavedBikesListOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): SavedBikesListConnection!
  node(id: ID!): Node
}

type Review {
  id: ID!
  rating: Int!
  comment: String
  createdAt: DateTime!
  userUid: String!
  bike: Bike!
}

type ReviewConnection {
  pageInfo: PageInfo!
  edges: [ReviewEdge]!
  aggregate: AggregateReview!
}

input ReviewCreateInput {
  rating: Int!
  comment: String
  userUid: String!
  bike: BikeCreateOneWithoutReviewsInput!
}

input ReviewCreateManyWithoutBikeInput {
  create: [ReviewCreateWithoutBikeInput!]
  connect: [ReviewWhereUniqueInput!]
}

input ReviewCreateWithoutBikeInput {
  rating: Int!
  comment: String
  userUid: String!
}

type ReviewEdge {
  node: Review!
  cursor: String!
}

enum ReviewOrderByInput {
  id_ASC
  id_DESC
  rating_ASC
  rating_DESC
  comment_ASC
  comment_DESC
  createdAt_ASC
  createdAt_DESC
  userUid_ASC
  userUid_DESC
  updatedAt_ASC
  updatedAt_DESC
}

type ReviewPreviousValues {
  id: ID!
  rating: Int!
  comment: String
  createdAt: DateTime!
  userUid: String!
}

input ReviewScalarWhereInput {
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
  rating: Int
  rating_not: Int
  rating_in: [Int!]
  rating_not_in: [Int!]
  rating_lt: Int
  rating_lte: Int
  rating_gt: Int
  rating_gte: Int
  comment: String
  comment_not: String
  comment_in: [String!]
  comment_not_in: [String!]
  comment_lt: String
  comment_lte: String
  comment_gt: String
  comment_gte: String
  comment_contains: String
  comment_not_contains: String
  comment_starts_with: String
  comment_not_starts_with: String
  comment_ends_with: String
  comment_not_ends_with: String
  createdAt: DateTime
  createdAt_not: DateTime
  createdAt_in: [DateTime!]
  createdAt_not_in: [DateTime!]
  createdAt_lt: DateTime
  createdAt_lte: DateTime
  createdAt_gt: DateTime
  createdAt_gte: DateTime
  userUid: String
  userUid_not: String
  userUid_in: [String!]
  userUid_not_in: [String!]
  userUid_lt: String
  userUid_lte: String
  userUid_gt: String
  userUid_gte: String
  userUid_contains: String
  userUid_not_contains: String
  userUid_starts_with: String
  userUid_not_starts_with: String
  userUid_ends_with: String
  userUid_not_ends_with: String
  AND: [ReviewScalarWhereInput!]
  OR: [ReviewScalarWhereInput!]
  NOT: [ReviewScalarWhereInput!]
}

type ReviewSubscriptionPayload {
  mutation: MutationType!
  node: Review
  updatedFields: [String!]
  previousValues: ReviewPreviousValues
}

input ReviewSubscriptionWhereInput {
  mutation_in: [MutationType!]
  updatedFields_contains: String
  updatedFields_contains_every: [String!]
  updatedFields_contains_some: [String!]
  node: ReviewWhereInput
  AND: [ReviewSubscriptionWhereInput!]
  OR: [ReviewSubscriptionWhereInput!]
  NOT: [ReviewSubscriptionWhereInput!]
}

input ReviewUpdateInput {
  rating: Int
  comment: String
  userUid: String
  bike: BikeUpdateOneRequiredWithoutReviewsInput
}

input ReviewUpdateManyDataInput {
  rating: Int
  comment: String
  userUid: String
}

input ReviewUpdateManyMutationInput {
  rating: Int
  comment: String
  userUid: String
}

input ReviewUpdateManyWithoutBikeInput {
  create: [ReviewCreateWithoutBikeInput!]
  delete: [ReviewWhereUniqueInput!]
  connect: [ReviewWhereUniqueInput!]
  disconnect: [ReviewWhereUniqueInput!]
  update: [ReviewUpdateWithWhereUniqueWithoutBikeInput!]
  upsert: [ReviewUpsertWithWhereUniqueWithoutBikeInput!]
  deleteMany: [ReviewScalarWhereInput!]
  updateMany: [ReviewUpdateManyWithWhereNestedInput!]
}

input ReviewUpdateManyWithWhereNestedInput {
  where: ReviewScalarWhereInput!
  data: ReviewUpdateManyDataInput!
}

input ReviewUpdateWithoutBikeDataInput {
  rating: Int
  comment: String
  userUid: String
}

input ReviewUpdateWithWhereUniqueWithoutBikeInput {
  where: ReviewWhereUniqueInput!
  data: ReviewUpdateWithoutBikeDataInput!
}

input ReviewUpsertWithWhereUniqueWithoutBikeInput {
  where: ReviewWhereUniqueInput!
  update: ReviewUpdateWithoutBikeDataInput!
  create: ReviewCreateWithoutBikeInput!
}

input ReviewWhereInput {
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
  rating: Int
  rating_not: Int
  rating_in: [Int!]
  rating_not_in: [Int!]
  rating_lt: Int
  rating_lte: Int
  rating_gt: Int
  rating_gte: Int
  comment: String
  comment_not: String
  comment_in: [String!]
  comment_not_in: [String!]
  comment_lt: String
  comment_lte: String
  comment_gt: String
  comment_gte: String
  comment_contains: String
  comment_not_contains: String
  comment_starts_with: String
  comment_not_starts_with: String
  comment_ends_with: String
  comment_not_ends_with: String
  createdAt: DateTime
  createdAt_not: DateTime
  createdAt_in: [DateTime!]
  createdAt_not_in: [DateTime!]
  createdAt_lt: DateTime
  createdAt_lte: DateTime
  createdAt_gt: DateTime
  createdAt_gte: DateTime
  userUid: String
  userUid_not: String
  userUid_in: [String!]
  userUid_not_in: [String!]
  userUid_lt: String
  userUid_lte: String
  userUid_gt: String
  userUid_gte: String
  userUid_contains: String
  userUid_not_contains: String
  userUid_starts_with: String
  userUid_not_starts_with: String
  userUid_ends_with: String
  userUid_not_ends_with: String
  bike: BikeWhereInput
  AND: [ReviewWhereInput!]
  OR: [ReviewWhereInput!]
  NOT: [ReviewWhereInput!]
}

input ReviewWhereUniqueInput {
  id: ID
}

type SavedBikesList {
  id: ID!
  userUid: String!
  bikes(where: BikeWhereInput, orderBy: BikeOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [Bike!]
}

type SavedBikesListConnection {
  pageInfo: PageInfo!
  edges: [SavedBikesListEdge]!
  aggregate: AggregateSavedBikesList!
}

input SavedBikesListCreateInput {
  userUid: String!
  bikes: BikeCreateManyInput
}

type SavedBikesListEdge {
  node: SavedBikesList!
  cursor: String!
}

enum SavedBikesListOrderByInput {
  id_ASC
  id_DESC
  userUid_ASC
  userUid_DESC
  createdAt_ASC
  createdAt_DESC
  updatedAt_ASC
  updatedAt_DESC
}

type SavedBikesListPreviousValues {
  id: ID!
  userUid: String!
}

type SavedBikesListSubscriptionPayload {
  mutation: MutationType!
  node: SavedBikesList
  updatedFields: [String!]
  previousValues: SavedBikesListPreviousValues
}

input SavedBikesListSubscriptionWhereInput {
  mutation_in: [MutationType!]
  updatedFields_contains: String
  updatedFields_contains_every: [String!]
  updatedFields_contains_some: [String!]
  node: SavedBikesListWhereInput
  AND: [SavedBikesListSubscriptionWhereInput!]
  OR: [SavedBikesListSubscriptionWhereInput!]
  NOT: [SavedBikesListSubscriptionWhereInput!]
}

input SavedBikesListUpdateInput {
  userUid: String
  bikes: BikeUpdateManyInput
}

input SavedBikesListUpdateManyMutationInput {
  userUid: String
}

input SavedBikesListWhereInput {
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
  userUid: String
  userUid_not: String
  userUid_in: [String!]
  userUid_not_in: [String!]
  userUid_lt: String
  userUid_lte: String
  userUid_gt: String
  userUid_gte: String
  userUid_contains: String
  userUid_not_contains: String
  userUid_starts_with: String
  userUid_not_starts_with: String
  userUid_ends_with: String
  userUid_not_ends_with: String
  bikes_every: BikeWhereInput
  bikes_some: BikeWhereInput
  bikes_none: BikeWhereInput
  AND: [SavedBikesListWhereInput!]
  OR: [SavedBikesListWhereInput!]
  NOT: [SavedBikesListWhereInput!]
}

input SavedBikesListWhereUniqueInput {
  id: ID
  userUid: String
}

type Subscription {
  bike(where: BikeSubscriptionWhereInput): BikeSubscriptionPayload
  booking(where: BookingSubscriptionWhereInput): BookingSubscriptionPayload
  review(where: ReviewSubscriptionWhereInput): ReviewSubscriptionPayload
  savedBikesList(where: SavedBikesListSubscriptionWhereInput): SavedBikesListSubscriptionPayload
}
`
      }
    