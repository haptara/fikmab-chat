import { Link, useForm, usePage } from "@inertiajs/react";
import { ChangeEvent, FormEventHandler, useRef, useState } from "react";
import { MdEmail } from "react-icons/md";
import { BsCamera } from "react-icons/bs";
import { UpdateProfileSchema } from "@/types/user";
import { TbRosetteDiscountCheckFilled } from "react-icons/tb";
import toast, { Toaster } from "react-hot-toast";

export default function UpdateProfileInformation({
  mustVerifyEmail,
  status,
  className = "",
}: {
  mustVerifyEmail: boolean;
  status?: string;
  className?: string;
}) {
  const user = usePage().props.auth.user;
  const avatarRef = useRef<HTMLImageElement>(null);

  const { setData, post } = useForm<UpdateProfileSchema>({
    _method: "PATCH",
    email: user.email,
    avatar: null,
  });

  const changeAvatar = async (e: ChangeEvent<HTMLInputElement>) => {
    const files = e.target.files;
    if (files && files.length > 0) {
      setData("avatar", files[0]);
      const imageUrl = window.URL.createObjectURL(files[0]);
      avatarRef.current?.setAttribute("src", imageUrl);
      // return () => {
      //   window.URL.revokeObjectURL(imageUrl);
      // };

      const formData = new FormData();
      formData.append("avatar", files[0]);

      try {
        const response = await fetch("/profile/avatar", {
          method: "POST",
          body: formData,
          headers: {
            "X-CSRF-TOKEN":
              (
                document.querySelector(
                  'meta[name="csrf-token"]',
                ) as HTMLMetaElement
              )?.content || "",
          },
        });
      } catch (error) {}
    }
  };

  return (
    <section className={className}>
      <div className="relative h-64">
        <img
          src="https://static.vecteezy.com/system/resources/thumbnails/021/693/952/small_2x/pastel-mesh-gradient-background-abstract-blurred-wallpaper-texture-png.png"
          alt="Banner Profil"
          className="absolute inset-0 h-full w-full object-cover opacity-50"
        />
      </div>

      <div className="p-8">
        <Toaster position="top-right" reverseOrder={false} />
        <form>
          <div className="flex flex-col items-start">
            <div className="picture relative">
              <img
                ref={avatarRef}
                // src={
                //   user.avatar
                //     ? `https://placehold.co/256x256/${user.avatar}/FFF?text=${user.name}&font=poppins`
                //     : user.jenis_kelamin === "Perempuan"
                //       ? "images/women.png"
                //       : "images/boy.png"
                // }
                src={user.avatar}
                alt={user.name}
                className="-mt-24 h-28 w-28 rounded-full border-4 border-background object-cover shadow-md"
              />

              <label
                htmlFor="avatar"
                className="btn btn-primary absolute -top-3 left-1/2 flex translate-x-5 cursor-pointer items-center justify-center rounded-full px-2"
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
              <input
                type="email"
                id="email-x"
                value={user.email}
                onChange={(e) => setData("email", e.target.value)}
                className="hidden"
              />
            </div>
            <h1 className="mt-8 flex items-center justify-center text-lg font-semibold text-foreground">
              {user.name}
              <TbRosetteDiscountCheckFilled className="ml-1 h-5 w-5 text-blue-500" />
            </h1>
            <p className="text-sm text-secondary-foreground">{user.status}</p>
          </div>
        </form>
        <div className="mt-4">
          <h2 className="mb-4 text-lg font-semibold text-foreground">
            Tentang Saya
          </h2>
          <p className="text-sm leading-relaxed text-secondary-foreground">
            {user.bio}
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
                {user.email}
              </span>
              {/* <span className="text-sm text-secondary-foreground">
                {user.email.replace(/(.{3})(.*)(?=@)/, (match, p1, p2) => {
                  return p1 + "*".repeat(p2.length);
                })}
              </span> */}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
function setPreview(avatar: any) {
  throw new Error("Function not implemented.");
}
