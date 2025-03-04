import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import { PageProps } from "@/types";
import { Head } from "@inertiajs/react";
import DeleteUserForm from "./Partials/DeleteUserForm";
import UpdatePasswordForm from "./Partials/UpdatePasswordForm";
import UpdateProfileInformationForm from "./Partials/UpdateProfileInformationForm";
import { Link, useForm, usePage } from "@inertiajs/react";
import { MdEmail } from "react-icons/md";
import { BsCamera } from "react-icons/bs";
import { UpdateProfileSchema } from "@/types/user";

import { ChangeEvent, FormEventHandler, useRef } from "react";

export default function Edit({
  mustVerifyEmail,
  status,
}: PageProps<{ mustVerifyEmail: boolean; status?: string }>) {
  const user = usePage<PageProps>().props.auth;
  const avatarRef = useRef<HTMLImageElement>(null);

  const { data, setData, post, errors, processing, recentlySuccessful } =
    useForm<UpdateProfileSchema>({
      _method: "PATCH",
      name: user.name,
      email: user.email,
      avatar: null,
    });

  const changeAvatar = (e: ChangeEvent<HTMLInputElement>) => {
    const files = e.target.files;
    if (files && files.length > 0) {
      setData("avatar", files[0]);

      const imageUrl = window.URL.createObjectURL(files[0]);
      avatarRef.current?.setAttribute("src", imageUrl);

      return () => {
        window.URL.revokeObjectURL(imageUrl);
      };
    }
  };

  return (
    <AuthenticatedLayout
      header={
        <h2 className="text-xl font-semibold leading-tight text-foreground">
          Profile
        </h2>
      }
    >
      <Head title="Profile" />

      <div className="py-4 sm:py-6">
        <div className="mx-auto max-w-7xl space-y-4 px-4 sm:space-y-6 sm:px-6">
          <div className="overflow-hidden rounded-lg bg-background shadow">
            <div className="relative h-64">
              <img
                src="https://static.vecteezy.com/system/resources/thumbnails/021/693/952/small_2x/pastel-mesh-gradient-background-abstract-blurred-wallpaper-texture-png.png"
                alt="Banner Profil"
                className="absolute inset-0 h-full w-full object-cover opacity-50"
              />
            </div>

            <div className="p-8">
              <div className="flex flex-col items-start">
                <div className="picture relative">
                  {/* // src="https://placehold.co/150" */}
                  <img
                    src={user.avatar}
                    alt={user.name}
                    className="-mt-24 h-28 w-28 rounded-full border-4 border-background shadow-md"
                  />

                  <label
                    htmlFor="avatar"
                    className="btn btn-primary absolute left-1/2 top-1 flex translate-x-5 cursor-pointer items-center justify-center rounded-full px-2"
                    tabIndex={0}
                  >
                    <BsCamera />
                    <input
                      type="file"
                      onChange={changeAvatar}
                      id="avatar"
                      className="hidden"
                    />
                  </label>
                </div>
                <h1 className="mt-8 text-lg font-semibold text-foreground">
                  Nama Lengkap | {user.avatar}
                </h1>
                <p className="text-sm text-secondary-foreground">Sibuk</p>
              </div>
              <div className="mt-4">
                <h2 className="mb-4 text-lg font-semibold text-foreground">
                  Tentang Saya
                </h2>
                <p className="text-sm leading-relaxed text-secondary-foreground">
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed
                  do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                  Ut enim ad minim veniam, quis nostrud exercitation ullamco
                  laboris nisi ut aliquip ex ea commodo consequat.
                </p>
              </div>
              <div className="mt-4">
                <h2 className="mb-4 text-lg font-semibold text-foreground">
                  Informasi Kontak
                </h2>
                <div className="grid grid-cols-1 gap-4 md:grid-cols-2">
                  <div className="flex items-center">
                    <MdEmail className="mr-2 h-4 w-4 text-primary" />
                    <span className="text-sm text-secondary-foreground">
                      email@example.com
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div className="rounded-lg bg-background p-4 shadow sm:p-8">
            <UpdateProfileInformationForm
              mustVerifyEmail={mustVerifyEmail}
              status={status}
              className="max-w-xl"
            />
          </div>

          <div className="rounded-lg bg-background p-4 shadow sm:p-8">
            <UpdatePasswordForm className="max-w-xl" />
          </div>

          <div className="rounded-lg bg-background p-4 shadow sm:p-8">
            <DeleteUserForm className="max-w-xl" />
          </div>
        </div>
      </div>
    </AuthenticatedLayout>
  );
}
