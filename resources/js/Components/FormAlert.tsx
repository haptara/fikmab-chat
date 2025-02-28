import clsx from "clsx";

type FormAlertProps = {
  message: string;
  className?: string;
};

export default function FormAlert({ message, className }: FormAlertProps) {
  return (
    // <div
    //   className={clsx(
    //     "rounded-lg bg-success/25 px-4 py-3 font-medium text-success-dark dark:bg-success/10",
    //     className,
    //   )}
    // >
    //   {message}
    // </div>

    <div
      className={clsx(
        "rounded-lg bg-success/25 px-4 py-3 shadow-md text-success-dark dark:bg-success/10",
        className,
      )}
    >
      <div className="flex items-start gap-2">
        <div className="flex items-center justify-center text-success-dark">
          <i className="bx bx-check-circle text-lg"></i>
        </div>
        <div>
          <span className="text-sm font-medium text-success-dark">Success</span>
          <p className="mt-1 text-xs">{message}</p>
        </div>
      </div>
    </div>
  );
}
