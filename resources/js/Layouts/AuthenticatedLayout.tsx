import ApplicationLogo from "@/Components/ApplicationLogo";
import NavLink from "@/Components/NavLink";
import { Link, usePage } from "@inertiajs/react";
import { PropsWithChildren, ReactNode } from "react";
import { BsBoxArrowRight } from "react-icons/bs";

export default function Authenticated({
  header,
  children,
}: PropsWithChildren<{ header?: ReactNode }>) {
  const user = usePage().props.auth.user;

  return (
    <div className="min-h-screen bg-secondary">
      <nav className="border-b border-secondary bg-background">
        <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
          <div className="flex h-16 justify-between">
            <div className="flex w-full gap-4">
              <div className="flex shrink-0 items-center">
                <Link href="/">
                  <ApplicationLogo className="block h-9 w-auto" />
                </Link>
              </div>

              {/* <div className="hidden space-x-8 sm:-my-px sm:ms-10 sm:flex"> */}
              <NavLink href={route("chats.index")} active={false}>
                Chats
              </NavLink>
              {/* </div> */}
            </div>

            <div className="ml-auto flex items-center">
              <Link
                href={route("logout")}
                as="button"
                method="post"
                className="btn btn-secondary flex items-center gap-2 whitespace-nowrap border-none"
              >
                <BsBoxArrowRight />
                Log out
              </Link>
            </div>
          </div>
        </div>
      </nav>

      {header && (
        <header className="bg-background shadow">
          <div className="mx-auto max-w-7xl p-4 sm:p-6">{header}</div>
        </header>
      )}

      <main>{children}</main>
    </div>
  );
}
