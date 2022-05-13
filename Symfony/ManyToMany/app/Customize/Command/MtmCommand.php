<?php

namespace Customize\Command;

use Customize\Entity\Student;
use Customize\Entity\StudentSubject;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Customize\Repository\SubjectRepository;

class MtmCommand extends Command
{
    private SubjectRepository $subjectRepository;
    private EntityManagerInterface $entityManager;

    // The name of the command (the part after "bin/console": bin/console mrmax:mtm
    protected static $defaultName = 'mrmax:mtm';

    // The description of the command
    protected static $defaultDescription = 'Import product.';

    /**
     * ImportProductCommand construct.
     *
     * @param  EntityManagerInterface  $entityManager
     *
     * @return void
     */
    public function __construct(
        EntityManagerInterface $entityManager,
        SubjectRepository $subjectRepository
    ) {
        $this->entityManager = $entityManager;
        $this->subjectRepository = $subjectRepository;

        parent::__construct();
    }

    /**
     * Execute command.
     *
     * @param  InputInterface  $input
     * @param  OutputInterface  $output
     *
     * @return void
     */
    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $subjects = $this->subjectRepository->findAll();

        $student = (new Student())
            ->setName('Student A');
        $this->entityManager->persist($student);

        foreach ($subjects as $index => $subject) {
            $sj = (new StudentSubject())
                ->setStudent($student)
                ->setSubject($subject)
                ->setScore(10 + $index);
            $this->entityManager->persist($sj);
        }

        $this->entityManager->flush();

    }
}