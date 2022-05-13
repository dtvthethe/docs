<?php

namespace Customize\Repository;

use Customize\Entity\Student;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

class StudentRepository extends ServiceEntityRepository
{
		/**
     * StudentRepository constructor.
     *
     * @param  RegistryInterface  $registry
     */
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Student::class);
    }
}