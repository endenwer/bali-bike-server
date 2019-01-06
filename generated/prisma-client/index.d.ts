// Code generated by Prisma (prisma@1.23.4). DO NOT EDIT.
// Please don't change this file manually but run `prisma generate` to update it.
// For more information, please read the docs: https://www.prisma.io/docs/prisma-client/

import { DocumentNode } from "graphql";
import {
  makePrismaClientClass,
  BaseClientOptions,
  Model
} from "prisma-client-lib";
import { typeDefs } from "./prisma-schema";

export type AtLeastOne<T, U = { [K in keyof T]: Pick<T, K> }> = Partial<T> &
  U[keyof U];

export interface Exists {
  bike: (where?: BikeWhereInput) => Promise<boolean>;
}

export interface Node {}

export type FragmentableArray<T> = Promise<Array<T>> & Fragmentable;

export interface Fragmentable {
  $fragment<T>(fragment: string | DocumentNode): Promise<T>;
}

export interface Prisma {
  $exists: Exists;
  $graphql: <T = any>(
    query: string,
    variables?: { [key: string]: any }
  ) => Promise<T>;

  /**
   * Queries
   */

  bike: (where: BikeWhereUniqueInput) => BikePromise;
  bikes: (
    args?: {
      where?: BikeWhereInput;
      orderBy?: BikeOrderByInput;
      skip?: Int;
      after?: String;
      before?: String;
      first?: Int;
      last?: Int;
    }
  ) => FragmentableArray<Bike>;
  bikesConnection: (
    args?: {
      where?: BikeWhereInput;
      orderBy?: BikeOrderByInput;
      skip?: Int;
      after?: String;
      before?: String;
      first?: Int;
      last?: Int;
    }
  ) => BikeConnectionPromise;
  node: (args: { id: ID_Output }) => Node;

  /**
   * Mutations
   */

  createBike: (data: BikeCreateInput) => BikePromise;
  updateBike: (
    args: { data: BikeUpdateInput; where: BikeWhereUniqueInput }
  ) => BikePromise;
  updateManyBikes: (
    args: { data: BikeUpdateManyMutationInput; where?: BikeWhereInput }
  ) => BatchPayloadPromise;
  upsertBike: (
    args: {
      where: BikeWhereUniqueInput;
      create: BikeCreateInput;
      update: BikeUpdateInput;
    }
  ) => BikePromise;
  deleteBike: (where: BikeWhereUniqueInput) => BikePromise;
  deleteManyBikes: (where?: BikeWhereInput) => BatchPayloadPromise;

  /**
   * Subscriptions
   */

  $subscribe: Subscription;
}

export interface Subscription {
  bike: (
    where?: BikeSubscriptionWhereInput
  ) => BikeSubscriptionPayloadSubscription;
}

export interface ClientConstructor<T> {
  new (options?: BaseClientOptions): T;
}

/**
 * Types
 */

export type MutationType = "CREATED" | "UPDATED" | "DELETED";

export type BikeOrderByInput =
  | "id_ASC"
  | "id_DESC"
  | "modelId_ASC"
  | "modelId_DESC"
  | "price_ASC"
  | "price_DESC"
  | "rating_ASC"
  | "rating_DESC"
  | "reviewsCount_ASC"
  | "reviewsCount_DESC"
  | "createdAt_ASC"
  | "createdAt_DESC"
  | "updatedAt_ASC"
  | "updatedAt_DESC";

export interface BikeWhereInput {
  id?: ID_Input;
  id_not?: ID_Input;
  id_in?: ID_Input[] | ID_Input;
  id_not_in?: ID_Input[] | ID_Input;
  id_lt?: ID_Input;
  id_lte?: ID_Input;
  id_gt?: ID_Input;
  id_gte?: ID_Input;
  id_contains?: ID_Input;
  id_not_contains?: ID_Input;
  id_starts_with?: ID_Input;
  id_not_starts_with?: ID_Input;
  id_ends_with?: ID_Input;
  id_not_ends_with?: ID_Input;
  modelId?: Int;
  modelId_not?: Int;
  modelId_in?: Int[] | Int;
  modelId_not_in?: Int[] | Int;
  modelId_lt?: Int;
  modelId_lte?: Int;
  modelId_gt?: Int;
  modelId_gte?: Int;
  price?: Int;
  price_not?: Int;
  price_in?: Int[] | Int;
  price_not_in?: Int[] | Int;
  price_lt?: Int;
  price_lte?: Int;
  price_gt?: Int;
  price_gte?: Int;
  rating?: Float;
  rating_not?: Float;
  rating_in?: Float[] | Float;
  rating_not_in?: Float[] | Float;
  rating_lt?: Float;
  rating_lte?: Float;
  rating_gt?: Float;
  rating_gte?: Float;
  reviewsCount?: Int;
  reviewsCount_not?: Int;
  reviewsCount_in?: Int[] | Int;
  reviewsCount_not_in?: Int[] | Int;
  reviewsCount_lt?: Int;
  reviewsCount_lte?: Int;
  reviewsCount_gt?: Int;
  reviewsCount_gte?: Int;
  AND?: BikeWhereInput[] | BikeWhereInput;
  OR?: BikeWhereInput[] | BikeWhereInput;
  NOT?: BikeWhereInput[] | BikeWhereInput;
}

export type BikeWhereUniqueInput = AtLeastOne<{
  id: ID_Input;
}>;

export interface BikeCreateInput {
  modelId: Int;
  price: Int;
  photos?: BikeCreatephotosInput;
  rating?: Float;
  reviewsCount?: Int;
}

export interface BikeCreatephotosInput {
  set?: String[] | String;
}

export interface BikeUpdateInput {
  modelId?: Int;
  price?: Int;
  photos?: BikeUpdatephotosInput;
  rating?: Float;
  reviewsCount?: Int;
}

export interface BikeSubscriptionWhereInput {
  mutation_in?: MutationType[] | MutationType;
  updatedFields_contains?: String;
  updatedFields_contains_every?: String[] | String;
  updatedFields_contains_some?: String[] | String;
  node?: BikeWhereInput;
  AND?: BikeSubscriptionWhereInput[] | BikeSubscriptionWhereInput;
  OR?: BikeSubscriptionWhereInput[] | BikeSubscriptionWhereInput;
  NOT?: BikeSubscriptionWhereInput[] | BikeSubscriptionWhereInput;
}

export interface BikeUpdateManyMutationInput {
  modelId?: Int;
  price?: Int;
  photos?: BikeUpdatephotosInput;
  rating?: Float;
  reviewsCount?: Int;
}

export interface BikeUpdatephotosInput {
  set?: String[] | String;
}

export interface NodeNode {
  id: ID_Output;
}

export interface AggregateBike {
  count: Int;
}

export interface AggregateBikePromise
  extends Promise<AggregateBike>,
    Fragmentable {
  count: () => Promise<Int>;
}

export interface AggregateBikeSubscription
  extends Promise<AsyncIterator<AggregateBike>>,
    Fragmentable {
  count: () => Promise<AsyncIterator<Int>>;
}

export interface BatchPayload {
  count: Long;
}

export interface BatchPayloadPromise
  extends Promise<BatchPayload>,
    Fragmentable {
  count: () => Promise<Long>;
}

export interface BatchPayloadSubscription
  extends Promise<AsyncIterator<BatchPayload>>,
    Fragmentable {
  count: () => Promise<AsyncIterator<Long>>;
}

export interface BikeEdge {
  node: Bike;
  cursor: String;
}

export interface BikeEdgePromise extends Promise<BikeEdge>, Fragmentable {
  node: <T = BikePromise>() => T;
  cursor: () => Promise<String>;
}

export interface BikeEdgeSubscription
  extends Promise<AsyncIterator<BikeEdge>>,
    Fragmentable {
  node: <T = BikeSubscription>() => T;
  cursor: () => Promise<AsyncIterator<String>>;
}

export interface Bike {
  id: ID_Output;
  modelId: Int;
  price: Int;
  photos: String[];
  rating?: Float;
  reviewsCount?: Int;
}

export interface BikePromise extends Promise<Bike>, Fragmentable {
  id: () => Promise<ID_Output>;
  modelId: () => Promise<Int>;
  price: () => Promise<Int>;
  photos: () => Promise<String[]>;
  rating: () => Promise<Float>;
  reviewsCount: () => Promise<Int>;
}

export interface BikeSubscription
  extends Promise<AsyncIterator<Bike>>,
    Fragmentable {
  id: () => Promise<AsyncIterator<ID_Output>>;
  modelId: () => Promise<AsyncIterator<Int>>;
  price: () => Promise<AsyncIterator<Int>>;
  photos: () => Promise<AsyncIterator<String[]>>;
  rating: () => Promise<AsyncIterator<Float>>;
  reviewsCount: () => Promise<AsyncIterator<Int>>;
}

export interface BikeConnection {
  pageInfo: PageInfo;
  edges: BikeEdge[];
}

export interface BikeConnectionPromise
  extends Promise<BikeConnection>,
    Fragmentable {
  pageInfo: <T = PageInfoPromise>() => T;
  edges: <T = FragmentableArray<BikeEdge>>() => T;
  aggregate: <T = AggregateBikePromise>() => T;
}

export interface BikeConnectionSubscription
  extends Promise<AsyncIterator<BikeConnection>>,
    Fragmentable {
  pageInfo: <T = PageInfoSubscription>() => T;
  edges: <T = Promise<AsyncIterator<BikeEdgeSubscription>>>() => T;
  aggregate: <T = AggregateBikeSubscription>() => T;
}

export interface PageInfo {
  hasNextPage: Boolean;
  hasPreviousPage: Boolean;
  startCursor?: String;
  endCursor?: String;
}

export interface PageInfoPromise extends Promise<PageInfo>, Fragmentable {
  hasNextPage: () => Promise<Boolean>;
  hasPreviousPage: () => Promise<Boolean>;
  startCursor: () => Promise<String>;
  endCursor: () => Promise<String>;
}

export interface PageInfoSubscription
  extends Promise<AsyncIterator<PageInfo>>,
    Fragmentable {
  hasNextPage: () => Promise<AsyncIterator<Boolean>>;
  hasPreviousPage: () => Promise<AsyncIterator<Boolean>>;
  startCursor: () => Promise<AsyncIterator<String>>;
  endCursor: () => Promise<AsyncIterator<String>>;
}

export interface BikeSubscriptionPayload {
  mutation: MutationType;
  node: Bike;
  updatedFields: String[];
  previousValues: BikePreviousValues;
}

export interface BikeSubscriptionPayloadPromise
  extends Promise<BikeSubscriptionPayload>,
    Fragmentable {
  mutation: () => Promise<MutationType>;
  node: <T = BikePromise>() => T;
  updatedFields: () => Promise<String[]>;
  previousValues: <T = BikePreviousValuesPromise>() => T;
}

export interface BikeSubscriptionPayloadSubscription
  extends Promise<AsyncIterator<BikeSubscriptionPayload>>,
    Fragmentable {
  mutation: () => Promise<AsyncIterator<MutationType>>;
  node: <T = BikeSubscription>() => T;
  updatedFields: () => Promise<AsyncIterator<String[]>>;
  previousValues: <T = BikePreviousValuesSubscription>() => T;
}

export interface BikePreviousValues {
  id: ID_Output;
  modelId: Int;
  price: Int;
  photos: String[];
  rating?: Float;
  reviewsCount?: Int;
}

export interface BikePreviousValuesPromise
  extends Promise<BikePreviousValues>,
    Fragmentable {
  id: () => Promise<ID_Output>;
  modelId: () => Promise<Int>;
  price: () => Promise<Int>;
  photos: () => Promise<String[]>;
  rating: () => Promise<Float>;
  reviewsCount: () => Promise<Int>;
}

export interface BikePreviousValuesSubscription
  extends Promise<AsyncIterator<BikePreviousValues>>,
    Fragmentable {
  id: () => Promise<AsyncIterator<ID_Output>>;
  modelId: () => Promise<AsyncIterator<Int>>;
  price: () => Promise<AsyncIterator<Int>>;
  photos: () => Promise<AsyncIterator<String[]>>;
  rating: () => Promise<AsyncIterator<Float>>;
  reviewsCount: () => Promise<AsyncIterator<Int>>;
}

/*
The `String` scalar type represents textual data, represented as UTF-8 character sequences. The String type is most often used by GraphQL to represent free-form human-readable text.
*/
export type String = string;

/*
The `ID` scalar type represents a unique identifier, often used to refetch an object or as key for a cache. The ID type appears in a JSON response as a String; however, it is not intended to be human-readable. When expected as an input type, any string (such as `"4"`) or integer (such as `4`) input value will be accepted as an ID.
*/
export type ID_Input = string | number;
export type ID_Output = string;

/*
The `Boolean` scalar type represents `true` or `false`.
*/
export type Boolean = boolean;

/*
The `Float` scalar type represents signed double-precision fractional values as specified by [IEEE 754](http://en.wikipedia.org/wiki/IEEE_floating_point). 
*/
export type Float = number;

/*
The `Int` scalar type represents non-fractional signed whole numeric values. Int can represent values between -(2^31) and 2^31 - 1. 
*/
export type Int = number;

export type Long = string;

/**
 * Model Metadata
 */

export const models: Model[] = [
  {
    name: "Bike",
    embedded: false
  }
];

/**
 * Type Defs
 */

export const prisma: Prisma;