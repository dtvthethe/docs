<?php

namespace Customize\Repository;

use Customize\Entity\Subject;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

class SubjectRepository extends ServiceEntityRepository
{
    /**
     * SubjectRepository constructor.
     *
     * @param  RegistryInterface  $registry
     */
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Subject::class);
    }
}