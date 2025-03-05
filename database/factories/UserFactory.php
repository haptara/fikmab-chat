<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class UserFactory extends Factory
{
    /**
     * The current password being used by the factory.
     */
    protected static ?string $password;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $hexColor = fake()->hexColor();
        $hexColorWithoutHash = ltrim($hexColor, '#');
        $gender = fake()->randomElement(['male', 'female']); // Pilih jenis kelamin secara acak
        $name = fake()->name($gender); // Hasilkan nama sesuai jenis kelamin


        return [
            'name' => $name,
            'email' => fake()->unique()->safeEmail(),
            'email_verified_at' => now(),
            'password' => static::$password ?? Hash::make('password'),
            'remember_token' => Str::random(10),
            'avatar' => $hexColorWithoutHash,
            'jenis_kelamin' => $gender === 'male' ? 'Laki-laki' : 'Perempuan',
            'bio'   => fake()->text()
        ];
    }

    /**
     * Indicate that the model's email address should be unverified.
     */
    public function unverified(): static
    {
        return $this->state(fn (array $attributes) => [
            'email_verified_at' => null,
        ]);
    }
}
