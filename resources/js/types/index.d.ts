// export interface User {
//   bio: string;
//   status: string;
//   avatar: any;
//   jenis_kelamin: string;
//   id: number;
//   name: string;
//   email: string;
//   email_verified_at?: string;
// }

import { User } from "@/types/user";

export type PageProps<
  T extends Record<string, unknown> = Record<string, unknown>,
> = T & {
  auth: {
    user: User;
  };
};
