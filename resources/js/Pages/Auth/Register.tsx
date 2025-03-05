import InputError from "@/Components/InputError";
import InputLabel from "@/Components/InputLabel";
import PrimaryButton from "@/Components/PrimaryButton";
import TextInput from "@/Components/TextInput";
import GuestLayout from "@/Layouts/GuestLayout";
import { Head, Link, useForm } from "@inertiajs/react";
import { FormEventHandler } from "react";
import { BsGenderMale } from "react-icons/bs"; // Laki-Laki
import { BsGenderFemale } from "react-icons/bs"; // Perempuan

export default function Register() {
  const { data, setData, post, processing, errors, reset } = useForm({
    name: "",
    email: "",
    password: "",
    password_confirmation: "",
    gender: "",
  });

  const submit: FormEventHandler = (e) => {
    e.preventDefault();

    post(route("register"), {
      onFinish: () => reset("password", "password_confirmation"),
    });
  };

  return (
    <GuestLayout>
      <Head title="Register" />
      {/* <blockquote className="text-center text-2xl font-semibold italic text-slate-900">
        When you look
        <span className="relative inline-block before:absolute before:-inset-1 before:block before:-skew-y-3 before:bg-pink-500">
          <span className="relative text-white">annoyed</span>
        </span>
        all the time, people think that you're busy.
      </blockquote> */}
      <form onSubmit={submit} className="space-y-4">
        <div>
          <InputLabel htmlFor="name" value="Name" />

          <TextInput
            id="name"
            name="name"
            value={data.name}
            className="mt-1 block w-full"
            autoComplete="name"
            isFocused={true}
            onChange={(e) => setData("name", e.target.value)}
          />

          <InputError message={errors.name} className="mt-2" />
        </div>

        <div>
          <InputLabel htmlFor="email" value="Email" />

          <TextInput
            id="email"
            type="email"
            name="email"
            value={data.email}
            className="mt-1 block w-full"
            autoComplete="username"
            onChange={(e) => setData("email", e.target.value)}
          />

          <InputError message={errors.email} className="mt-2" />
        </div>

        <div>
          <InputLabel htmlFor="password" value="Password" />

          <TextInput
            id="password"
            type="password"
            name="password"
            value={data.password}
            className="mt-1 block w-full"
            autoComplete="new-password"
            onChange={(e) => setData("password", e.target.value)}
          />

          <InputError message={errors.password} className="mt-2" />
        </div>

        <div>
          <InputLabel
            htmlFor="password_confirmation"
            value="Confirm Password"
          />

          <TextInput
            id="password_confirmation"
            type="password"
            name="password_confirmation"
            value={data.password_confirmation}
            className="mt-1 block w-full"
            autoComplete="new-password"
            onChange={(e) => setData("password_confirmation", e.target.value)}
          />

          <InputError message={errors.password_confirmation} className="mt-2" />
        </div>

        <div>
          <InputLabel htmlFor="jenis_kelamin" value="Jenis Kelamin" />

          <div className="my-2 grid gap-4 md:grid-cols-2">
            <label className="flex cursor-pointer items-center justify-between space-x-2 rounded-lg border p-3 has-[:checked]:bg-primary/10 has-[:checked]:text-primary has-[:checked]:ring-2 has-[:checked]:ring-primary/50">
              <div className="flex items-center space-x-2">
                <BsGenderMale className="h-5 w-5" />
                <span>Laki-Laki</span>
              </div>
              <input
                type="radio"
                className="h-4 w-4 appearance-none rounded-full border checked:border-primary checked:bg-primary focus:outline-none focus:ring-2 focus:ring-primary/20"
                name="gender"
                value="Laki-laki"
                onChange={(e) => setData("gender", e.target.value)}
              />
            </label>
            <label className="flex cursor-pointer items-center justify-between space-x-2 rounded-lg border p-3 has-[:checked]:bg-primary/10 has-[:checked]:text-primary has-[:checked]:ring-2 has-[:checked]:ring-primary/50">
              <div className="flex items-center space-x-2">
                <BsGenderFemale className="h-5 w-5" />
                <span>Perempuan</span>
              </div>
              <input
                type="radio"
                className="h-4 w-4 appearance-none rounded-full border checked:border-primary checked:bg-primary focus:outline-none focus:ring-2 focus:ring-primary/20"
                name="gender"
                value="Perempuan"
                onChange={(e) => setData("gender", e.target.value)}
              />
            </label>
          </div>
          <InputError message={errors.gender} className="mt-2" />
        </div>

        <div className="flex items-center">
          <PrimaryButton className="w-full" disabled={processing}>
            Register
          </PrimaryButton>
        </div>

        <div className="flex justify-center">
          <Link href={route("login")} className="btn-link">
            Already registered?
          </Link>
        </div>
      </form>
    </GuestLayout>
  );
}
