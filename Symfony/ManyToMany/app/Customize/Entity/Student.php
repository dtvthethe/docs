<?php

namespace Customize\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * class Student
 *
 * @ORM\Table(name="dtb_student")
 * @ORM\InheritanceType("SINGLE_TABLE")
 * @ORM\DiscriminatorColumn(name="discriminator_type", type="string", length=255)
 * @ORM\HasLifecycleCallbacks()
 * @ORM\Entity(repositoryClass="Customize\Repository\StudentRepository")
 */
class Student
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private int $id;

    /**
     * @ORM\Column(name="name", type="string", length=255)
     */
    private string $name;


    /**
     * @ORM\OneToMany(targetEntity="StudentSubject", mappedBy="student", fetch="EXTRA_LAZY")
     */
    private $studentStudentSubjects;

    public function __construct()
    {

        $this->studentStudentSubjects = new ArrayCollection();
    }

    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param  int  $id
     *
     * @return $this
     */
    public function setId(int $id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param  string  $name
     *
     * @return $this
     */
    public function setName(string $name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * @return Collection|Subject[]
     */
    public function getSubjects(): Collection
    {
        return $this->studentStudentSubjects;
    }

    public function addSubject(Subject $subject): self
    {
        if (!$this->studentStudentSubjects->contains($subject)) {
            $this->studentStudentSubjects[] = $subject;
        }

        return $this;
    }

    public function removeSubject(Subject $subject): self
    {
        $this->studentStudentSubjects->removeElement($subject);

        return $this;
    }
}